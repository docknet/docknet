#!/bin/bash

# Check if the runtime is up
if [ "$(docker ps -q -f name=server)" ]; then
	# Stopping the server is time consuming,
	# doing it in separate process. Sadly,
	# semicolons do not work with the "&" operator.
	docker stop server > /dev/null &
	STOP_RUNTIME_PROCESS_IDENTIFIER=${!}
	
	# Redeploy the app with the new version of the binary
	echo $'\nRestarting server...';
	# Wait until the server is fully stopped 
	# before starting again
	wait ${STOP_RUNTIME_PROCESS_IDENTIFIER}
	docker start server > /dev/null;
	echo $'Server restarted!';
	exit 0;
fi

# The runtime container was not running, start 
# the whole environment.
echo $'Starting server...\n';
docker compose --env-file local-infra/.env up -d --no-recreate;
echo $'\nServer started!';
exit 0;