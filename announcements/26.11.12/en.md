# November 12 Update Notes
Please finish your current run before updating, as updating may affect runs in progress.
# Default Branch Update
## Updates Shared by Both Branches
### New Content and Improvements
- Added Imperial Seal, which lets you carry two relics and drops an extra random relic when first obtained.
- Added Dragon Skeleton, which can add an Ares item to treasure rooms in exchange for Heart Containers.
- Added Orb of Exile, which drops a stat gem after each battle and an extra gem if you finish without taking damage.
- Added a shop item that drops an extra Coin Bag when you enter a shop and prevents explosions from scaring away the shopkeeper.
- Added Book of Nobody, which makes dropped items rapidly cycle through random alternatives.
- Added a set-effect category to the item Codex.
- Updated opening animations and effects for various chests, along with visuals for some rooms, bosses, and enemies.
- Added support for 21:9 desktop resolutions and improved switching between windowed, borderless, and fullscreen modes, including UI refreshes after resolution changes.
### Combat and Item Fixes
- Fixed YOKO repeatedly entering its charge animation and failing to attack automatically when no Hatchmon could be absorbed.
- Fixed GHOSTPRINT and its phantom projectiles failing to receive projectile count bonuses correctly.
- Fixed projectile count affixes not working correctly with LITHOSURGE.
- Fixed VOLTEDGE’s remaining-energy hover blocking movement or jumping, and hover state persisting after changing rooms.
- Fixed aiming jitter at close range, cursor flickering during repeated attacks, and incorrect aiming directions with single-stick controls.
- Fixed downward platform movement during some melee attacks and platform checks when dashing toward a target.
- Fixed Fake Diamond granting too few rewards for large purchases outside combat.
- Fixed Flame Gem’s post-revival health cap so regular characters correctly return with one full Heart.
- Fixed Immortal Heart failing to restore R7’s starting Shields on revival.
- Increased Skate Shoes’ double-tap window to 0.6 seconds and fixed the duration of its afterimages.
- Removed Under Flower’s previous 6-second trigger cooldown.
- Carrot Police Badge now also accelerates egg hatching after successful Smiley Merchant Roulette results. Fixed it failing to trigger on later chest roulette rolls.
- Fixed occasionally receiving one fewer blessing stack when fixed and random blessings were applied together.
- Fixed reselecting Duotheism while it was in its spike state failing to fully charge and activate it.
### Co-op and Room Fixes
- Fixed the Artisan Temple failing to allow another reforge after all rewards disappeared. The four-choice rewards are now reserved for the player who forged them, and simultaneous co-op interactions are handled correctly.
- Fixed stage selections failing to synchronize in co-op Storm Breach and clients entering boss rooms too early.
- Fixed clients’ doors getting out of sync, boss room doors remaining blocked after a clear, and exits becoming unusable.
- Improved loading and reconnect timeout handling to reduce premature disconnections during slow loads.
- Updated death handling in Classic co-op challenge rooms so death no longer triggers the protective teleport.
- Fixed dance room machines being activated repeatedly by electric hits and controls becoming locked if a QTE failed to start correctly.
- Fixed some enemies becoming stuck in floors or walls and preventing room clears.
- Limited the fishing room to one natural appearance per run.
- Fixed dropped weapons floating near shop doors and guaranteed fallback relics disappearing after repeated purchases in the coin-faith temple shop.
- Fixed Smiley Counter roulettes becoming unusable after changing rooms.
### Save and Interface Improvements
- Improved room continuation in solo Classic runs. Valid progress is saved when leaving a cleared room or confirming a return to the main menu, allowing more room states to be restored when you continue.
- Fixed incomplete restoration of chests, doors, merchants, faith rooms, machine uses, and dance room progress when continuing a solo Classic run. Ground weapons and both weapon slots now retain their affixes, Soul progress, and dynamic stats.
- Fixed loan amounts not being saved correctly, causing incorrect debt states after continuing a run.
- Fixed continuation issues in the fishing room and lost Spinal Fluid stacks.
- Fixed Steam cloud reward cosmetics not appearing and cosmetic ownership failing to synchronize after switching save slots online.
- Fixed the overhead upgrade bar showing the previous weapon’s data after switching weapons.
- Fixed scrolling failing to follow controller navigation in cosmetic grids, stale focus in the co-op lobby list, and missing tags in achievement reward popups.
- Corrected some purchase, reward, and collection displays, and updated localized text, cosmetic icons, and effects.
# Beta Branch Update
The Beta branch includes the content listed under “Updates Shared by Both Branches” above and introduces Sakura Discipline.
### New Mode: Sakura Discipline
- Sakura Discipline is now available on the Beta branch, bringing a solo challenge built around sword attacks, rolling, and projectile reflection.
- Enter through mode selection and unlock stages as you progress. The stage selection screen shows ratings and personal bests.
- Reflect eligible enemy projectiles during the active window of a sword swing and send them back toward enemies.
- Stage-specific rules include delayed explosions after enemy deaths and marked targets whose defeat stops other enemies from reviving.
- A dedicated scoring and rating system evaluates your kill score, clear time, highest kill streak, and accuracy, and records personal bests and attempt counts.
- Clear Stage 5 to unlock the Endless Challenge, which tracks the highest number of combat rooms reached.
- Added dedicated stage selection, combat HUD, and results presentation, with options to continue to the next stage or retry the current challenge.
**Veewo Games**