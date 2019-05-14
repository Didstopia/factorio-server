#!/usr/bin/env bash

set -m

FACTORIO_VERSION="${FACTORIO_VERSION:-stable}"

# Get the old build id (default to 0)
OLD_BUILDID=0
if [ -f "/factorio/build.id" ]; then
	OLD_BUILDID="$(cat /factorio/build.id)"
fi

# Get the new build id
NEW_BUILDID=$(curl -s --head -L https://www.factorio.com/get-download/${FACTORIO_VERSION}/headless/linux64 | grep ETag | tr -d '\n');

# Check that we actually got a new build id
STRING_SIZE=${#NEW_BUILDID}
if [ "$STRING_SIZE" -lt "6" ]; then
	echo "Error getting latest server version, automatic updates disabled.."
	echo "Response was: $NEW_BUILDID"
	exit
fi

# Check if the builds match and quit if so
if [ "$OLD_BUILDID" = "$NEW_BUILDID" ]; then
	echo "Version $OLD_BUILDID is already the latest, skipping update.."
	exit
else
	echo "Latest server version ($NEW_BUILDID) is newer than the current one ($OLD_BUILDID), updating.."

	
	if [ -z "$1" ]
	then
		# If Factorio is already running (This isn't the startup run), we simply close it, which restarts the container
		kill 1
	else
		#This is the startup run
		#LATEST_LINK=$(node /scraper/app.js url);
                LATEST_LINK=https://www.factorio.com/get-download/${FACTORIO_VERSION}/headless/linux64
		#wget -q --show-progress --no-check-certificate $LATEST_LINK -O /factorio.tar.xz && \
		wget -q --no-check-certificate $LATEST_LINK -O /factorio.tar.xz && \
		tar -xJf /factorio.tar.xz -C / && \
		chmod +x /factorio/bin/x64/factorio && \
		rm -fr /factorio.tar.xz
		
		echo $NEW_BUILDID > /factorio/build.id
	fi
fi
