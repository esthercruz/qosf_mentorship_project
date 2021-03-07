# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.158.0/containers/ubuntu/.devcontainer/base.Dockerfile

# [Choice] Ubuntu version: bionic, focal
ARG VARIANT="focal"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

# Only need to install .NET Core SDK 3.1
# Intstructions: 
RUN wget https://packages.microsoft.com/config/ubuntu/20.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb

USER root
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install apt-transport-https \
    && apt-get update && apt-get install -y dotnet-sdk-3.1 libgomp1

# Drop back down to user permissions for things that don't need it.
USER ${USER}
