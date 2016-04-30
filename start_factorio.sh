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

FACTORIO_STARTUP_COMMAND=--start-server "$FACTORIO_WORLD_NAME".zip --autosave-interval "$FACTORIO_AUTOSAVE_INTERVAL" --latency-ms "$FACTORIO_LATENCY_MS"
if [ ! -z ${FACTORIO_NO_AUTO_PAUSE+x} ]; then
	if [ "$FACTORIO_NO_AUTO_PAUSE" = "1" ]; then
		RUST_STARTUP_COMMAND="$RUST_STARTUP_COMMAND --no-auto-pause"
	fi
fi
# Run the server
echo "Starting Factorio.."
./factorio/bin/x64/factorio $FACTORIO_STARTUP_COMMAND &
pid="$!"

wait
