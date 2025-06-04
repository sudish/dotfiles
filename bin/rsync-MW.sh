#!/bin/sh
# rsync Mod Organizer 2 with Portable Morrowind instance to Steam Deck

# local MUST end with /
local=/mnt/c/Games/MorrowindMods/Tools/MO2/
remote=Games/mod-organizer-2-morrowind/MO2

# files listed after the rsync command will be ignored by the rsync
# this is useful for separate configs on the 2 machines
# do NOT remove the EOF on its own line at the end, it ends the list

rsync -avh --delete --exclude-from=- --info=progress2 "$local" deckard:"$remote" <<EOF
ModOrganizer.ini
mods/Dynamic FPS Optimization/MWSE/config/gridlist.json
mods/Dynamic FPS Optimization/MWSE/config/whitelist.json
mods/v1ld Settings & Tweaks/MWSE/config/animationBlending.json
mods/v1ld Settings & Tweaks/MWSE/config/DFPSO.json
mods/v1ld Settings & Tweaks/MWSE/config/MWSE.json
mods/v1ld Settings & Tweaks/MWSE/config/seph.hudCustomizer.json
mods/v1ld Settings & Tweaks/MWSE/config/Wonders of Water.json
downloads
*.log
logs
nxmhandler.ini
webcache
EOF
