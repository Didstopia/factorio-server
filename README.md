# Factorio server that runs inside a Docker container

NOTE: This image will always install/update to the latest Factorio server. In case a new version is found, the server will restart and install the update.

# How to run the server
1. Set the environment variables you wish to modify from below
2. Enjoy!

The following environment variables are available:
```
FACTORIO_WORLD_NAME (DEFAULT: "docker" - Name of the save zip file)
FACTORIO_NO_AUTO_PAUSE (DEFAULT: "0" - Set to 1 to keep the game running when no players are connected)
```
