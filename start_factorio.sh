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

# Run the server
echo "Starting Factorio.."
./factorio/bin/x64/factorio --start-server "$FACTORIO_WORLD_NAME".zip --autosave-interval "$FACTORIO_AUTOSAVE_INTERVAL" --latency "$FACTORIO_LATENCY" &
pid="$!"

wait
