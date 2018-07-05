#!/bin/bash 

./docker_build.sh

# Run the server
docker run -p 34197:34197/udp -v $(pwd)/factorio_data:/factorio --name factorio-server --rm -it didstopia/factorio-server:latest
#docker logs -f factorio-server
