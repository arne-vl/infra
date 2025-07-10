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

# Install xrdp for remote desktop access
sudo apt install -y xrdp

# Enable xrdp service
sudo systemctl enable xrdp

# Tell xrdp to use xfce4
echo xfce4-session >~/.xsession

# Restart xrdp service
sudo systemctl restart xrdp

# Set timezone to Europe/Brussels
sudo timedatectl set-timezone Europe/Brussels

echo "xfce4 desktop environment and xrdp have been installed and configured."
