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
	user-secrets)
		# Delete the first parameter from the script invocation 
		# ($1="user-secrets")
		shift
		# Execute the script with the remaining parameters 
		# (arguments for "docknet user-secrets")
		source ./local-infra/docknet/scripts/user-secrets.sh "$@"
		;;
	add|list|remove|restore)
		source ./local-infra/docknet/scripts/command_project_options_generic.sh "$@"
		;;
	tool)
		source ./local-infra/docknet/scripts/command_options_generic.sh "$@"
		;;
	watch)
		echo 'WIP' 
		;;
	dotnet-ef|ef)
		echo 'WIP' 
		;;
	*)
		echo "Please, specify a valid docknet command"
		;;
esac

exit 0;
