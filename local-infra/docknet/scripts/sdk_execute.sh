#!/bin/bash

# Start the container if it's stopped or build
# and start it if it doesn't exist.
if [ ! "$(docker ps -q -f name=sdk)" ]; then
	echo $'Starting SDK...\n';
    docker compose up -d sdk;
    echo $'\nSDK successfully built!\n';
fi

# TODO: When creating a new dotnet project, we need to ensure that all projects that 
# allow the "--exclude-launch-settings" flag use it. This is the way to ensure
# that "dotnet watch" will work since no arbitrary port will be defined.
#if [ "$1" == 'new' ] && ["$2" == 'worker']; then

#fi

docker exec -it sdk dotnet "$@";
exit 0;