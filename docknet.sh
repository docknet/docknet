#!/bin/bash

# First parameter will always be the dotnet command to execute.
case $1 in
	run)
		source ./local-infra/docknet/scripts/run.sh
		;;
	watch)
		source ./local-infra/docknet/scripts/watch.sh "$@"
		;;
	destroy)
		source ./local-infra/docknet/scripts/destroy.sh 
		;;
	*)
		source ./local-infra/docknet/scripts/sdk_execute.sh "$@"
		;;
esac

exit 0;
