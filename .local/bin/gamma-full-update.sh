#!/bin/bash
#
# Runs a full GAMMA update. To force a clean copy of each mod, existing
# mods are removed first. Any mods we've installed after GAMMA are first
# safely tucked away. Does some clean ups after the install, like restoring
# user.ltx and removing reshade.

die() { echo "$1"; exit 1; }

# All my mods must be in a section at the very end of the MO2 mod list
MO2_SECTION=v1ld
# MO2 adds a "_separator" suffix to the end of the name
MO2_SEPARATOR="${MO2_SECTION}_separator"

BASE="${HOME}/Games/STALKER"
ANOMALY="${BASE}/ANOMALY"
APPDATA="${ANOMALY}/appdata"
GAMMA="${BASE}/GAMMA"
MODS="${GAMMA}/mods"
MODLIST="${GAMMA}/profiles/v1ld/modlist.txt"
CACHE="${BASE}/gamma-launcher-cache"
TMP="${BASE}/tmp"

[[ -d $BASE ]]    || die "$BASE not a directory"
[[ -d $ANOMALY ]] || die "$ANOMALY not a directory"
[[ -d $APPDATA ]] || die "$APPDATA not a directory"
[[ -d $GAMMA ]]   || die "$GAMMA not a directory"
[[ -d $MODS ]]    || die "$MODS not a directory"
[[ -r $USERLTX ]] || die "$USERLTX not a readable file"
[[ -r $MODLIST ]] || die "$MODLIST not a readable file"
[[ -d $CACHE ]]   || mkdir -p "$CACHE" || die "couldn't mkdir $CACHE"
[[ -d $TMP ]]     || mkdir -p "$TMP"   || die "couldn't mkdir $TMP"

grep "$MO2_SEPARATOR" "$MODLIST" || die "$MODLIST doesn't have a $MO2_SEPARATOR line"

sed -e 1d -e "s/^.//p" -e "/${MO2_SEPARATOR}/q" < "$MODLIST" |\
  while IFS= read -r line; do
    mod=$(echo "$line" | sed -e "s/\r$//")
    echo "Moving $mod"
    mv "$MODS/$mod" "$TMP"
  done

[[ -f ${APPDATA}/user.ltx ]] && cp "${APPDATA}/user.ltx" "${TMP}/user.ltx" 

rm -rf "${MODS:?}"/*
rm -f "${ANOMALY}"/bin/AnomalyDX11*.exe   # so new exes do not overwrite through symlinks

# force a def update as Grok sometimes doesn't bump the version number though adding new mods
rm -f "${BASE}/GAMMA/.Grok's Modpack Installer/version.txt"

gamma-launcher full-install --anomaly "${ANOMALY}" \
                            --gamma "${GAMMA}" \
                            --cache-directory "${CACHE}"

mv "${TMP}"/* "$MODS"
[[ -f $TMP/user.ltx ]] && mv "${TMP}/user.ltx" "${APPDATA}/user.ltx"

rm -f "${ANOMALY}"/bin/d3d9.dll "${ANOMALY}"/bin/dxgi.*   # disable reshade
rm -f "${APPDATA}"/Atmos*.ltx                             # remove outdated Atmos configs
