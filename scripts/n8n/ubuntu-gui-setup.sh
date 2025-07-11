#!/usr/bin/env bash

################################################################
#
# Name:         ubuntu-gui-setup.sh
# Description:  Script to set up xfce4 desktop environment on a Linux server.
# Author:       Arne Van Looveren
# Date:         2025-07-10
# Version:      1.0
#
# Usage:        ./ubuntu-gui-setup.sh
#
################################################################

# Update
sudo apt update && sudo apt upgrade -y

# Install xfce4 desktop environment
sudo apt install -y xfce4 xfce4-goodies apt-utils

# Install browser
sudo apt install -y firefox

# Install text editor
sudo apt install -y vim

# Install xrdp for remote desktop access
sudo apt install -y xrdp

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
sudo usermod -aG docker "$USER"

echo "Docker installed successfully."

# Enable xrdp service
sudo systemctl enable xrdp

# Tell xrdp to use xfce4
echo xfce4-session > ~/.xsession

# Restart xrdp service
sudo systemctl restart xrdp

# Set timezone to Europe/Brussels
sudo timedatectl set-timezone Europe/Brussels

echo "xfce4 desktop environment and xrdp have been installed and configured."
echo "Rebooting in 5 seconds..."
sleep 5
sudo reboot
