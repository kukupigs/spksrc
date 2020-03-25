# Package specific behaviours
# Sourced script by generic installer and start-stop-status scripts

# https://github.com/dotnet/core/issues/4011
[ -z "$DOTNET_BUNDLE_EXTRACT_BASE_DIR" ] && export DOTNET_BUNDLE_EXTRACT_BASE_DIR="${XDG_CACHE_HOME:-"/var/packages/jellyfin/target/var/"}/dotnet_bundle_extract"

# fix Error processing request: /volume1/@appstore/jellyfin/var/data/transcodes does not exist.
# Why doesn't jellyfin create the folder since it is the default path?
mkdir -p /volume1/@appstore/jellyfin/var/data/transcodes
chown sc-jellyfin:jellyfin /volume1/@appstore/jellyfin/var/data/transcodes

SERVICE_COMMAND="${SYNOPKG_PKGDEST}/jellyfin --noautorunwebapp --package-name synology -d ${SYNOPKG_PKGDEST}/var/data -C ${SYNOPKG_PKGDEST}/var/cache -c ${SYNOPKG_PKGDEST}/var/config -l ${SYNOPKG_PKGDEST}/var/log -w ${SYNOPKG_PKGDEST}/web"

SVC_BACKGROUND=y
SVC_WRITE_PID=y

GROUP=sc-media
