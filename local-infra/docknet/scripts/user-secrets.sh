#!/bin/bash

# Validate mandatory argument presence.
if [ -z "$1" ]; then
	echo $'Missing docknet user-secrets command to execute!\n';
	echo $'\nFor more information, please refer to the official documentation: https://learn.microsoft.com/en-us/dotnet/core/tools/';
	exit 1;
fi

# Start the container if it's stopped or build
# and start it if it doesn't exist.
if [ ! "$(docker ps -q -f name=sdk)" ]; then
	echo $'Starting SDK...\n';
    docker-compose up -d sdk;
    echo $'\nSDK successfully built!\n';
fi

userSecretsCommand="$1";
# Delete the first parameter that states the dotnet command and has already been taken into account.
shift;

# Add remaining options to the command execution
for option in "$@"; do
    userSecretsCommand+=" ";
    userSecretsCommand+="$option";
done

# Add project name at the end, so the container can identify the project.
docker exec -it sdk dotnet user-secrets ${userSecretsCommand};
exit 0;