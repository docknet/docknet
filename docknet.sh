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
	user-secrets)
		echo 'WIP' 
		;;
	ef)
		echo 'WIP' 
		;;
	add|list|remove|restore)
		source ./local-infra/docknet/scripts/command_project_options_generic.sh "$@"
		;;
	*)
		echo "Please, specify a valid docknet command"
		;;
esac

exit 0;
