#!/bin/bash

# Start the container if it's stopped or build
# and start it if it doesn't exist.
if [ ! "$(docker ps -q -f name=sdk)" ]; then
	echo $'Starting SDK...\n';
    if ! docker compose up -d sdk; then
        echo "Error: Failed to start the sdk container."
        exit 1;
    fi
    echo $'\nSDK successfully built!\n';
fi

# When creating a new dotnet project, we need to ensure that all projects that 
# allow the "--exclude-launch-settings" flag use it. This is the way to ensure
# that no arbitrary port will be defined in the running profiles and 
# "dotnet watch" will work.
projects_which_can_exclude_launch_settings=(
    "worker" "grpc" "blazor" "blazorwasm" "web" "mvc" "webapp" "razor" "webapi" "webapiaot"
);

if [ "$1" == 'new' ] && \
[[ ! "$@" =~ "--exclude-launch-settings" ]]; then
    for no_launch_settings_project in "${projects_which_can_exclude_launch_settings[@]}"; do
        if [ "$2" == "$no_launch_settings_project" ]; then
            docker exec -it sdk dotnet "$@" --exclude-launch-settings;
            exit 0;
        fi
    done
fi

docker exec -it sdk dotnet "$@";
exit 0;