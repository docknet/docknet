#!/bin/bash

# TODO: Override project name to the one set in a ".env" file

# Check if the sdk is up
if [ "$(docker ps -q -f name=sdk)" ]; then
    # Execute command in SDK container with the received arguments
    docker exec -it sdk dotnet new "$@";
    exit 0;
fi

# Start the container if it's stopped or build
# and start it if it doesn't exist.
echo $'Starting SDK...\n';
docker-compose up -d sdk;
echo $'\nSDK successfully built!\n';
# Execute command in SDK container with the received arguments
docker exec -it sdk dotnet new "$@";
exit 0;