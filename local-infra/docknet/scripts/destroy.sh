#!/bin/bash

# Activate the Bash extended globbing pattern.
shopt -s extglob

# Delete dotnet project
rm -rf local-infra/docknet/usersecrets/*
rm -rf .config
rm -rf !("docker-compose.yml"|"docknet.sh"|"local-infra"|"README.md")