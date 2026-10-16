# October 16 Update Notes
Please finish your current run before updating, as updating may cause issues with in-progress runs.
# Default Branch Update
---
### Bug Fixes
- Fixed an issue where corrupted local saves on Steam could trap players in a retry loop and prevent them from entering the game. If recovery is unavailable, players can choose to delete the affected local save slot and start over.
- Fixed a potential crash when loading a save or continuing a run.
- Fixed boss objectives not being restored correctly in some older saves.
- Fixed incomplete achievement progress for clearing the game with different agents, and added missing progress from existing historical clears.
- Fixed basketballs becoming unresponsive after being taken by another player in co-op, or remaining occupied after the player holding them disconnected.
- Fixed inconsistent reward ownership when two players grabbed the same item simultaneously in a co-op claw machine room.
- Fixed inconsistent key and crystal consumption and door state when multiple players tried to unlock a door simultaneously in co-op.
- Fixed mismatched door states between the host and other players that could prevent passage in co-op.
- Fixed duplicate purchases of the same shop item and inconsistent restock states in co-op.
- Fixed the floor number not matching the host's after reconnecting in Classic Mode.
- Fixed the co-op host being assigned the wrong P1/P2 identity in the bar.
- Fixed room boundary protection being disabled too early when co-op players occupied different rooms.
- Fixed an issue where certain chests could no longer be interacted with after quickly leaving a room in single-player mode.
- Fixed cleanup errors when dismantling items that had not finished initializing, which could disrupt subsequent pickups.
- Fixed an issue where the portal used to end a run could incorrectly take players to the next floor after returning from a weapon upgrade room.
- Fixed teleport arrival points overlapping with the gathering area for returning in certain Temples of Faith and teleport rooms.
- Fixed dress-up category icons and selection and hover states disappearing after scene changes, and selection backgrounds covering other elements.
- Fixed incorrect images in character boss records.
- Fixed character and emote previews remaining visible after switching screens, and recovery issues after certain navigation failures.
- Fixed conflicts between text input, gameplay shortcuts, and confirm/back controls. The text input confirmation prompt now correctly shows Enter.
- Fixed mail categories not displaying correctly when opening mail through the bar mailbox.
- Fixed visual masking issues in certain trap rooms.
### Adjustments and Improvements
- Added a tutorial skip option: when one save has completed the tutorial, players can choose to skip it for other saves that are still in the tutorial stage.
- Added a confirmation prompt before abandoning the current run and returning to the bar from the main menu.
- The safehouse now provides an exit to end the run when all boss portals are locked.
- The in-run timer now pauses while players are in the safehouse, preventing boss portals from timing out while they wait.
- Reduced Scream Soda's trigger cooldown from 3 seconds to 1 second.
- Reduced the number of different agents required to clear the game for the related achievement from 10 to 3.
- Improved Ascend's attack direction and the orientation of its small flying swords when a target is locked.
- Improved void enemy spawn effects and warnings for their death effects to make them easier to distinguish.
- All players now use the host’s difficulty settings for each co-op minigame round.
- Reduced processing overhead in scenes with large numbers of projectiles.
- Improved handling of repeated clicks, confirmation, and back navigation on character, mode, difficulty, and level selection screens.
- Restored supported 16:10 display resolutions and improved the save selection layout on narrower screens.
- Improved the placement of interaction prompts for portals used to end a run and updated some localized text.
---
### How to Switch to the Beta Branch
Steam Library \>\>\> Neon Abyss 2 \>\>\> Right-click \>\>\> Properties \>\>\> Betas \>\>\> Beta (no password required)
Please note that players on different branches cannot play co-op together due to version differences.
**Veewo Games**