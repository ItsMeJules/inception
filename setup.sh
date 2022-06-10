#!/bin/bash

RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
BLUE=`tput setaf 6`
RESET=`tput sgr0`

APPS_NEEDED=("curl" "vim" "lsb-release" "git" "docker" "docker-compose-plugin")

update_repostitories () { sudo apt-get -yqq update || { echo "${RED}Failed to update exiting...${RESET}" ; exit 1; }; }

docker_install () {
	echo "[${GREEN}Docker${RESET}] ${YELLOW}Setting up the repository...${RESET}"
	sudo apt-get -yqq install ca-certificates gnupg \
		|| { echo "${RED}Failed to update exiting...${RESET}" ; exit 1; }

	echo "[${GREEN}Docker${RESET}] ${YELLOW}Adding Docker's official GPG key...${RESET}"
	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

	echo "[${GREEN}Docker${RESET}] ${YELLOW}Setting up the stable repository...${RESET}"
 	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
	$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

	echo "[${GREEN}Docker${RESET}] ${YELLOW}Installing the engine...${RESET}"
	update_repostitories
	sudo apt-get -yqq install docker-ce docker-ce-cli containerd.io docker-compose-plugin \
		|| { echo "${RED}Failed to update exiting...${RESET}" ; exit 1; }
	echo "[${GREEN}Docker${RESET}] ${BLUE}should be installed successfully.${RESET}"
}

echo "${GREEN}updating packages..."
update_repostitories
for app in "${APPS_NEEDED[@]}"; do
	if [ "$app" = "lsb-release" ]; then
		which lsb_release > /dev/null
	elif [ "$app" = "docker-compose-plugin" ]; then
		docker compose --version > /dev/null
	else
		which $app > /dev/null
	fi
	rc=$?
	if [ $rc -eq 0 ]; then
		echo "[${GREEN}$app${RESET}] ${YELLOW}is already installed.${RESET}"
		continue
	fi
	if [ "$app" = "docker" ]; then
		docker_install
		continue
	fi
	echo "[${GREEN}$app${RESET}] is being installed...${RESET}"
	sudo apt-get -yqq install $app > /dev/null \
		|| { echo "${RED}Failed to update exiting...${RESET}" ; exit 1; }
	echo "[${GREEN}$app${RESET}] ${BLUE}is now installed.${RESET}"
done