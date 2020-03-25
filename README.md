# Factorio server that runs inside a Docker container
[![Docker Automated build](https://img.shields.io/docker/automated/didstopia/factorio-server.svg)](https://hub.docker.com/r/didstopia/factorio-server/)
[![Docker build status](https://img.shields.io/docker/build/didstopia/factorio-server.svg)](https://hub.docker.com/r/didstopia/factorio-server/)
[![Docker Pulls](https://img.shields.io/docker/pulls/didstopia/factorio-server.svg)](https://hub.docker.com/r/didstopia/factorio-server/)
[![Docker stars](https://img.shields.io/docker/stars/didstopia/factorio-server.svg)](https://hub.docker.com/r/didstopia/factorio-server)

NOTE: This image will always install/update to the latest Factorio server. In case a new version is found, the server will restart and install the update.

# How to run the server
1. Set the environment variables you wish to modify from below
2. Enjoy!

The following environment variables are available:
```
FACTORIO_WORLD_NAME (DEFAULT: "docker" - Name of the save zip file)
FACTORIO_SERVER_SETTINGS (DEFAULT: "" - Set to 1 to the full file path of your server-settings.json *inside the container*, if you use one, ie. `/factorio/server-settings.json`)
FACTORIO_VERSION (DEFAULT: "stable" - Set to "stable" or "latest")
```
