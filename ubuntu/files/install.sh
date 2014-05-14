#!/bin/bash

# Install script for base Ubuntu OS

printf "\n [*] Upgrade packages\n"
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

printf "\n [*] Install OpenSSH, Supervisor, Sudo and Vim\n"
DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server supervisor vim sudo
apt-get clean
mkdir -p /var/run/sshd
mkdir -p /var/log/supervisor

printf "\n [*] Changing root password\n"
echo "root:docker" | chpasswd

printf "\n [*] Install complete!\n"
