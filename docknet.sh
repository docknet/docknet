#!/bin/bash

# First parameter will always be the command to execute.
case $1 in
	run)
		source ./local-infra/docknet/scripts/run.sh
		;;
	new)
		# Delete the first parameter from the script invocation 
		# ($1="new")
		shift
		# Execute the script with the remaining parameters 
		# (arguments for "docknet new")
		source ./local-infra/docknet/scripts/new.sh "$@"
		;;
	watch)
		echo 'WIP' 
		;;
	dotnet-ef|ef)
		echo 'WIP' 
		;;
	destroy)
		source ./local-infra/docknet/scripts/destroy.sh 
		;;
	*)
		source ./local-infra/docknet/scripts/sdk_execute.sh "$@"
		;;
esac

exit 0;
