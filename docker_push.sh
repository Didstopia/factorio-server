#!/bin/bash

# Set Docker to use the machine
eval "$(docker-machine env default)"

docker tag -f didstopia/factorio-server:latest didstopia/factorio-server:latest
docker push didstopia/factorio-server:latest