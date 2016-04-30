#!/bin/bash

# Set Docker to use the machine
eval "$(docker-machine env default)"

docker commit factorio-server didstopia/factorio-server:latest
