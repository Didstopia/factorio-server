#!/usr/bin/env bash

pid=0

trap 'exit_handler' SIGHUP SIGINT SIGQUIT SIGTERM
exit_handler()
{
	echo "Shutdown signal received"
	sleep 1
	kill $pid
	exit
}

FACTORIO_STARTUP_COMMANDS=""
if [ ! -z ${FACTORIO_NO_AUTO_PAUSE+x} ]; then
	if [ "$FACTORIO_NO_AUTO_PAUSE" = "1" ]; then
		FACTORIO_STARTUP_COMMANDS="$FACTORIO_STARTUP_COMMANDS --no-auto-pause"
	fi
fi
# Run the server
echo "Starting Factorio.."
./factorio/bin/x64/factorio --start-server "$FACTORIO_WORLD_NAME".zip --autosave-interval "$FACTORIO_AUTOSAVE_INTERVAL" --latency-ms "$FACTORIO_LATENCY_MS" $FACTORIO_STARTUP_COMMANDS &
pid="$!"

wait
