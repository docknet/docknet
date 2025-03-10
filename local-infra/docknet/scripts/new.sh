#!/bin/bash

# Validate mandatory argument presence.
if [ -z "$1" ]; then
    Cyan='\033[0;36m';
    ColorOff='\033[0m';

    echo $'Missing dotnet project template. The intended way to use this command is:\n';
    
    echo -e "${Cyan}docknet new <template>${ColorOff}";
    
    echo $'\nExample valid template values: web, razor, console, webapi, etc.';
    echo 'For more information, please refer to the official documentation: https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-new';
    exit 1;
fi

# Enable importation of environment variables.
set -a;
# Import environment variables.
source .env;
# Disable importation of environment variables.
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