#!/usr/bin/env bash

FACTORIO_STARTUP_COMMANDS=""
if [ ! -z ${FACTORIO_NO_AUTO_PAUSE+x} ]; then
	if [ "$FACTORIO_NO_AUTO_PAUSE" = "1" ]; then
		FACTORIO_STARTUP_COMMANDS="$FACTORIO_STARTUP_COMMANDS --no-auto-pause"
	fi
fi

# Check for autosave file
echo "Checking autosaves.."
cd /factorio/saves && ./check_autosave.sh

# Run the server
echo "Starting Factorio.."
cd /
./factorio/bin/x64/factorio --start-server "$FACTORIO_WORLD_NAME".zip --autosave-interval "$FACTORIO_AUTOSAVE_INTERVAL" --latency-ms "$FACTORIO_LATENCY_MS" $FACTORIO_STARTUP_COMMANDS
