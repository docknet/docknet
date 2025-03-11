#!/bin/bash

# Enable importation of environment variables.
set -a;
# Import environment variables.
source .env;
# Disable importation of environment variables.
set +a;

# Check if the sdk is up
if [ "$(docker ps -q -f name=sdk)" ]; then
	# Execute command in SDK container.
	docker exec -it sdk dotnet restore ${PROJECT_NAME};
	exit 0;
fi

# Start the container if it's stopped or build
# and start it if it doesn't exist.
echo $'Starting SDK...\n';
docker-compose up -d sdk;
echo $'\nSDK successfully built!\n';
# Execute command in SDK container.
docker exec -it sdk dotnet restore ${PROJECT_NAME};
exit 0;