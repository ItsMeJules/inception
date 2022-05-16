#!/bin/bash

RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
BLUE=`tput setaf 6`
RESET=`tput sgr0`

read -p "${YELLOW}Do you want to install ${GREEN}Docker? [y/N]${RESET}" docker

if ["$docker" == "y"] 
then
	echo "${YELLOW}Setting up the repository..."
	sudo apt-get update
	sudo apt-get install ca-certificates curl gnupg lsb-release
	echo "${YELLOW}Adding Docker's official GPG key..."
	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
	echo "${YELLOW}Setting up the stable repository..."
 	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
fi
