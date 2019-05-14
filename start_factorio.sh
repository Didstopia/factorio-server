#!/usr/bin/env bash

# Check for updates and install if necessary
./update_check.sh bootrun

# Setup Factorio startup arguments
FACTORIO_STARTUP_COMMANDS="--port ${FACTORIO_PORT}"
if [ ! -z ${FACTORIO_SERVER_SETTINGS+x} ]; then
	if [ "$FACTORIO_SERVER_SETTINGS" != "" ]; then
		FACTORIO_STARTUP_COMMANDS="$FACTORIO_STARTUP_COMMANDS --server-settings $FACTORIO_SERVER_SETTINGS"
	fi
fi

## TODO: Since we can't check for updates properly right now, this would just cause issues for us..
# Start cron
echo "Starting scheduled task manager.."
node /scheduler_app/app.js &

# Set the working directory
cd /

## TODO: Disabled, because I think this has been implemented as part of the game itself now?
# Check for autosave file
#echo "Checking autosaves.."
#./check_autosave.sh

# Run the server (create map if it doesn't exist yet)
echo "Starting Factorio.."
if ! find -L /factorio/saves/ -iname \*.zip -mindepth 1 -print | grep -q .; then
	/factorio/bin/x64/factorio --create "/factorio/saves/$FACTORIO_WORLD_NAME.zip" $FACTORIO_STARTUP_COMMANDS || true
fi
exec -a /factorio/bin/x64/factorio /factorio/bin/x64/factorio --start-server-load-latest $FACTORIO_STARTUP_COMMANDS
