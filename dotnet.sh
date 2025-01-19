#!/bin/bash

# First parameter will always be the command to execute.
case $1 in

  run)
    source ./local-infra/dotnet/scripts/run.sh
    ;;

  restore).
    echo 'WIP, run in SDK container'
    ;;

  new)
    # Delete the first parameter from the script invocation 
    # ($1="new")
    shift
    # Execute the script with the remaining parameters 
    # (arguments for "dotnet new")
    source ./local-infra/dotnet/scripts/new.sh "$@"
    ;;

  watch)
    echo 'WIP' 
    ;;

  user-secrets)
    echo 'WIP' 
    ;;

  add-package)
    echo 'WIP' 
    ;;

  ef)
    echo 'WIP' 
    ;;

  *)
    echo "Please, specify a valid dotnet command"
    ;;
esac

exit 0;
