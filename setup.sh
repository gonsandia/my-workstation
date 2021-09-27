#!/bin/bash

# Fail immediately if any errors occur
set -e

echo
echo "################################################################"
echo "  Setup Workstation                                             "
echo "################################################################"
echo

echo "Caching [sudo] password..."
sudo -K
sudo true;

echo
echo "################################################################"
echo "  Updating the system                                           "
echo "################################################################"
echo

# Upgrade
sudo apt update
sudo apt full-upgrade -y

echo
echo "################################################################"
echo "  Installing requirements for repositories                      "
echo "################################################################"
echo

# Required to add repositories
sudo apt install -y \
    ca-certificates \
    apt-transport-https \
    software-properties-common

# Software installation

./software/install-curl.sh
./software/install-diodon.sh
./software/install-docker.sh
./software/install-fzf.sh
./software/install-git.sh
./software/install-gnome-applications.sh
./software/install-google-chrome.sh
./software/install-gparted.sh
./software/install-htop.sh
./software/install-jetbrains-toolbox.sh
./software/install-ncdu.sh
./software/install-net-tools.sh
./software/install-sensors.sh
./software/install-slack.sh
./software/install-traceroute.sh
./software/install-unrar.sh
./software/install-visual-studio-code.sh
./software/install-zsh.sh

./software/uninstall-applications-by-default.sh

# Custom config
./custom/gtile-gnome-shell-extension.sh
./custom/install-dotfiles.sh

echo
echo "################################################################"
echo "  Updating the system                                           "
echo "################################################################"
echo

# Upgrade
sudo apt update
sudo apt --fix-broken install
sudo apt upgrade -y
sudo apt autoremove -y
