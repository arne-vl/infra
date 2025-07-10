#!/usr/bin/env bash

################################################################
#
# Name:         n8n-setup.sh
# Description:  Script to set up n8n on a Linux server.
# Author:       Arne Van Looveren
# Date:         2025-07-10
# Version:      1.0
#
# Usage:        ./n8n-setup.sh
#
################################################################

# Update and install dependencies
sudo apt update && sudo apt upgrade -y

# Add Docker's official GPG key:
sudo apt update
sudo apt install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

echo "Installing Docker..."
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Docker installed successfully."

# Setup n8n using Docker
mkdir -p ~/n8n

# Move the docker-compose file to the n8n directory
cp docker-compose.yml ~/n8n/
cd ~/n8n || exit 1

mkdir data
mkdir files

sudo chown -R 1000:1000 ./data
sudo chown -R 1000:1000 ./files

if [[ "$(sudo docker compose up -d)" -eq 0 ]]; then
    echo
    echo "n8n is now running. You can access it at http://localhost:5678"
else
    echo
    echo "Failed to start n8n. Please check the logs for more details."
    exit 1
fi

