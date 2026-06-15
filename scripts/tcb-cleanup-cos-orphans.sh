#!/usr/bin/env bash
# tcb-cleanup-cos-orphans.sh
#
# Remove COS files that exist in hosting but no longer exist in the git repo.
# Guards against orphan accumulation from `tcb hosting deploy` (which only
# uploads/overwrites, never deletes).
#
# SAFETY:
#   - Whitelist: ONLY touches paths under announcements/ and the root index.json.
#   - NEVER touches __auth/ (CloudBase login system files) or anything else.
#   - --dry-run by default; requires --yes to actually delete.
#
# Bash 3.2 compatible (macOS default). No associative arrays.
#
# Usage:
#   ./tcb-cleanup-cos-orphans.sh <envId> [--yes] [--repo-root <path>]
#
# Examples:
#   # Preview what would be removed (no deletion):
#   ./tcb-cleanup-cos-orphans.sh neon-backend-dev-3fx27og6365fcc6
#
#   # Actually remove orphans, repo root auto-detected from CWD:
#   ./tcb-cleanup-cos-orphans.sh neon-backend-dev-3fx27og6365fcc6 --yes

# /bin/bash 3.2 has no -eou pipefail combo quirks; set explicitly.
set -eu
set -o pipefail

# --- args ---
ENV_ID=""
DO_DELETE=false
REPO_ROOT="${PWD}"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --yes) DO_DELETE=true; shift ;;
    --repo-root) REPO_ROOT="$2"; shift 2 ;;
    *) ENV_ID="$1"; shift ;;
  esac
done

if [[ -z "$ENV_ID" ]]; then
  echo "ERROR: envId is required" >&2
  echo "Usage: $0 <envId> [--yes] [--repo-root <path>]" >&2
  exit 1
fi

# Whitelisted prefixes that this script is allowed to manage.
# Anything outside these (e.g. __auth/) is NEVER touched.
WHITELIST_REGEX='^(announcements/|index\.json$)'

TMPDIR_LOCAL="$(mktemp -d)"
trap 'rm -rf "$TMPDIR_LOCAL"' EXIT

SHOULD_FILE="$TMPDIR_LOCAL/should.txt"
COS_FILE="$TMPDIR_LOCAL/cos.txt"
ORPHANS_FILE="$TMPDIR_LOCAL/orphans.txt"
: > "$SHOULD_FILE"
: > "$COS_FILE"
: > "$ORPHANS_FILE"

echo "=== COS orphan cleanup ==="
echo "envId:        $ENV_ID"
echo "repoRoot:     $REPO_ROOT"
echo "mode:         $(${DO_DELETE} && echo 'DELETE (real)' || echo 'DRY-RUN (no deletion)')"
echo "whitelist:    $WHITELIST_REGEX  (only these paths are inspectable)"
echo

# --- 1. Build the set of files that SHOULD exist (from git repo) ---
while IFS= read -r -d '' f; do
  rel="${f#"$REPO_ROOT"/}"
  rel="${rel#./}"
  if [[ "$rel" =~ $WHITELIST_REGEX ]]; then
    printf '%s\n' "$rel" >> "$SHOULD_FILE"
  fi
done < <(find "$REPO_ROOT" -type f \( -path "*/announcements/*" -o -name "index.json" \) -not -path "*/.git/*" -not -path "*/actions-runner/*" -print0)

SHOULD_COUNT=$(wc -l < "$SHOULD_FILE" | tr -d ' ')
echo "git-repo whitelisted files: $SHOULD_COUNT"
echo

# --- 2. Build the set of files currently in COS (whitelisted only) ---
# The announcement repo is small (well under pagination limits), so a single
# `tcb hosting list /` returns everything. Filter by whitelist here.
tcb hosting list / -e "$ENV_ID" --json 2>/dev/null | python3 -c "
import sys, json, re
raw = sys.stdin.read()
m = raw.find('{')
d = json.loads(raw[m:])
rx = re.compile(r'^(announcements/|index\.json$)')
for f in d.get('data', []):
    k = f['key']
    if rx.search(k):
        print(k)
" >> "$COS_FILE"

COS_COUNT=$(wc -l < "$COS_FILE" | tr -d ' ')
echo "COS whitelisted files: $COS_COUNT"
echo

# --- 3. Compute orphans = COS - SHOULD_EXIST ---
# grep -vxF: match whole lines exactly, invert. Files in COS but not in SHOULD.
grep -vxF -f "$SHOULD_FILE" "$COS_FILE" > "$ORPHANS_FILE" || true

ORPHANS_COUNT=$(wc -l < "$ORPHANS_FILE" | tr -d ' ')
echo "orphans (in COS, not in git): $ORPHANS_COUNT"
echo

if [[ "$ORPHANS_COUNT" -eq 0 ]]; then
  echo "✓ No orphans. COS is in sync with git."
  exit 0
fi

echo "Orphan files to $(${DO_DELETE} && echo 'delete' || echo 'preview'):"
sed 's/^/  /' "$ORPHANS_FILE"
echo

# --- 4. Delete (if --yes) or stop here (dry-run) ---
if [[ "$DO_DELETE" != "true" ]]; then
  echo "DRY-RUN: no files deleted. Re-run with --yes to actually remove."
  exit 0
fi

echo "Deleting orphans..."
DELETED=0
FAILED=0
while IFS= read -r key; do
  [[ -z "$key" ]] && continue
  if tcb hosting delete "$key" -e "$ENV_ID" --json >/dev/null 2>&1; then
    echo "  ✓ deleted: $key"
    DELETED=$((DELETED+1))
  else
    echo "  ✗ FAILED:  $key" >&2
    FAILED=$((FAILED+1))
  fi
done < "$ORPHANS_FILE"

echo
echo "Done. deleted=$DELETED failed=$FAILED"
[[ "$FAILED" -eq 0 ]] || exit 1
