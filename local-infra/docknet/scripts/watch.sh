#!/bin/bash

# Check if the sdk is up
if [ ! "$(docker ps -q -f name=server)" ]; then
	docker compose --env-file local-infra/.env up -d --no-recreate;
fi

# Execute command in server container.
docker exec -it server dotnet "$@";
exit 0;