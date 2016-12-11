#!/bin/bash

./docker_build.sh

docker tag didstopia/factorio-server:latest didstopia/factorio-server:latest
docker push didstopia/factorio-server:latest
