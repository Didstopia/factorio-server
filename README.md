# Factorio server that runs inside a Docker container

Updated up to version **0.12.35**.

**NOTE**: In order to run the server, you need to supply it with a valid world save file (as .zip).
Simply places this in the /factorio/saves folder and set ```FACTORIO_WORLD_NAME``` to match the filename (don't include the ".zip" part).

# How to run the server
1. Set the environment variables you wish to modify from below
2. Mount ```/factorio/saves``` on the host and place a save file there (ie. "docker.zip")
3. Enjoy!

The following environment variables are available:
```
FACTORIO_WORLD_NAME (DEFAULT: "docker" - Name of the save zip file)
FACTORIO_AUTOSAVE_INTERVAL (DEFAULT: "1" - Autosave interval in minutes)
FACTORIO_LATENCY_MS (DEFAULT: "250" - Latency in milliseconds)
FACTORIO_NO_AUTO_PAUSE (DEFAULT: "0" - Set to 1 to keep the game running when no players are connected)
```
