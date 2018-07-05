#!/usr/bin/env bash

# Check for updates and install if necessary
./update_check.sh

# Setup Factorio startup arguments
FACTORIO_STARTUP_COMMANDS=""
if [ ! -z ${FACTORIO_SERVER_SETTINGS+x} ]; then
	if [ "$FACTORIO_SERVER_SETTINGS" != "" ]; then
		FACTORIO_STARTUP_COMMANDS="$FACTORIO_STARTUP_COMMANDS --server-settings $FACTORIO_SERVER_SETTINGS"
	fi
fi

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
if [ ! -f "/factorio/saves/$FACTORIO_WORLD_NAME.zip" ]; then
	/factorio/bin/x64/factorio --create "/factorio/saves/$FACTORIO_WORLD_NAME.zip" $FACTORIO_STARTUP_COMMANDS || true
fi
exec /factorio/bin/x64/factorio --start-server "/factorio/saves/$FACTORIO_WORLD_NAME.zip" $FACTORIO_STARTUP_COMMANDS