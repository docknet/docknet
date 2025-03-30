#!/bin/bash

# This script handles all dotnet CLI commands that follow the "<command> <command_options>" pattern.
# This removes the need to implement a script for each command that follows this pattern.
#
# Examples: 
#   - dotnet restore
#   - dotnet add package <dotnet_add_package options>

# Validate mandatory argument presence.
if [ -z "$1" ]; then
	echo $'Missing docknet command to execute!\n';
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

dotnetCommand="dotnet $1";
# Delete the first parameter that states the dotnet command and has already been taken into account.
shift;

# Add remaining options to the command execution
for option in "$@"; do
    dotnetCommand+=" ";
    dotnetCommand+="$option";
done

docker exec -it sdk ${dotnetCommand};
exit 0;