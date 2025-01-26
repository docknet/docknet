#!/bin/bash

# Enable importing of environment variables.
set -a;
# Import environment variables.
source .env;
# Disable importing of environment variables.
set +a;

# Check if the sdk is up
if [ "$(docker ps -q -f name=sdk)" ]; then
    # Execute command in SDK container with the received arguments
    # and .env variables.
    docker exec -it sdk dotnet new $1 --name ${PROJECT_NAME};
    exit 0;
fi

# Start the container if it's stopped or build
# and start it if it doesn't exist.
echo $'Starting SDK...\n';
docker-compose up -d sdk;
echo $'\nSDK successfully built!\n';
# Execute command in SDK container with the received arguments
# and .env variables.
docker exec -it sdk dotnet new $1 --name ${PROJECT_NAME};
exit 0;