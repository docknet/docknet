#!/bin/bash

# First parameter will always be the command to execute.
case $1 in

	run)
		source ./local-infra/docknet/scripts/run.sh
		;;

  	restore)
		source ./local-infra/docknet/scripts/restore.sh
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

	add)
		# Delete the first parameter from the script invocation 
		# ($1="add")
		shift
		# Execute the script with the remaining parameters 
		# (arguments for "docknet add")
		source ./local-infra/docknet/scripts/add.sh "$@"
		;;

	ef)
		echo 'WIP' 
		;;

	*)
		echo "Please, specify a valid docknet command"
		;;
esac

exit 0;
