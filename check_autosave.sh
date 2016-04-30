#!/usr/bin/env bash

if [ -z "${FACTORIO_WORLD_NAME}" ]; then
	echo "Didn't find the original savefile, skipping autosave check!"
	exit 1
fi

# Construct the zip file name for the original savefile
ORIGINAL_SAVE_FILE="$FACTORIO_WORLD_NAME".zip

# Check that we can find the "latest" save file
LATEST_SAVE_FILE=$(ls -t /factorio/saves/*.zip 2> /dev/null | head -1)
if [ -z "${LATEST_SAVE_FILE}" ]; then
	echo "Didn't find any savefiles, skipping autosave check!"
	exit 1
fi

# Check if the latest file is the original file, if so bail out
if [ "${LATEST_SAVE_FILE}" == "${ORIGINAL_SAVE_FILE}" ]; then
	echo "Original savefile is the latest, skipping autosave check!"
	exit 1
fi

# Copy the latest save file over the original save file
echo "Using latest save file:" $LATEST_SAVE_FILE
cp /factorio/saves/$LATEST_SAVE_FILE /factorio/saves/$ORIGINAL_SAVE_FILE
