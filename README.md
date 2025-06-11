# Requirements (Windows):
1. WSL 2.
2. Docker.
3. VSCode.
4. Dev containers extension for VSCode.

# How to use the environment:
1. Fork this repo.
2. Unsync your forked project from this repo in "Settings" -> "Leave fork network".
3. Clone the repository into your local environment.
4. Start the docker infrastructure with "docker compose up -d".
5. Attach vsCode to the "sdk" container using the dev containers extension.
6. Create a project of your preference using "dotnet new \<project_template>\". Add the "--exclude-launch-settings" options when possible if you don't want dotnet to select an arbitrary port were the project will run.
7. You can now develop using dotnet as if it was installed on your PC, with the particularity that the user secrets will be available in "/local-infra/usersecrets/\<user-secrets-id\>/secrets.json" for convenience, while also being protected against accidental an push thanks to the infrastructure ".gitignore" file

# Customization:
- The default infrastructure comes with a PostgreSQL database because you'll typically want to have a database connected to your dotnet application. If that's not the case, simply remove the postgres-database service from the docker-compose.ymñ file.
- The default infrastructure pulls the "6daniel32/docknet-sdk" container from dockerhub. This container is a very simple wrapper around the official dotnet sdk from microsoft. My wrapper just copies the local files into the container and keeps the container running by doing "CMD ["sleep", "infinity"]". You can find the original wrapper's dockerfile in the development branch of this repo and customize it however you want after doing a fork.
