#!/bin/bash

# Set Docker to use the machine
eval "$(docker-machine env default)"

# Run the server
docker run -p 34197:34197/udp -v $(pwd)/factorio_data:/factorio/saves --name factorio-server -d didstopia/factorio-server:latest
docker logs -f factorio-server
