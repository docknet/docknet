#!/bin/bash

Cyan='\033[0;36m';
ColorOff='\033[0m';

# Validate mandatory argument presence.
if [ -z "$1" ]; then
	echo $'Missing command segment. The intended way to use this command is:\n';
	
	echo -e "${Cyan}docknet add <command_segment>${ColorOff}";

	echo $'\nFor more information, please refer to the official documentation: https://learn.microsoft.com/en-us/dotnet/core/tools/';
	exit 1;
fi

# Select subcommand to be executed.
case $1 in

	package)
		source ./local-infra/docknet/scripts/add.sh_options/package.sh
		;;
	
	reference)
		echo 'referenceWIP';
		;;

	*)
		echo $'Wrong value for command segment.\n';
		echo -e "The valid values for <command_segement> are: ${Cyan}package, reference.${ColorOff}";
		echo $'\nFor more information, please refer to the official documentation: https://learn.microsoft.com/en-us/dotnet/core/tools/';
		exit 1;
		;;
esac

exit 0;