# Factorio server that runs inside a Docker container

Updated up to version **0.12.29**.

**NOTE**: In order to run the server, you need to supply it with a valid world save file (as .zip).
Simply places this in the /factorio/saves folder and set ```FACTORIO_WORLD_NAME``` to match the filename (don't include the ".zip" part).

# How to run the server
1. Set the environment variables you wish to modify from below
2. Mount ```/factorio/saves``` on the host and place a save file there (ie. "docker.zip")
3. Enjoy!

The following environment variables are available:
```
ENV FACTORIO_WORLD_NAME (DEFAULT: "docker" - Name of the save zip file)
ENV FACTORIO_AUTOSAVE_INTERVAL (DEFAULT: "1" - Autosave interval in minutes)
ENV FACTORIO_LATENCY (DEFAULT: "12" - Latency in ticks)
```
