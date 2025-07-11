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

# Setup n8n using Docker
mkdir -p ~/n8n

# Move the docker-compose file to the n8n directory
cp docker-compose.yml ~/n8n/
cd ~/n8n || exit 1

mkdir data
mkdir files

sudo chown -R 1000:1000 ./data
sudo chown -R 1000:1000 ./files

if [[ "$(docker compose up -d)" -eq 0 ]]; then
    echo
    echo "n8n is now running. You can access it at http://localhost:5678"
else
    echo
    echo "Failed to start n8n. Please check the logs for more details."
    exit 1
fi

