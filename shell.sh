#!/bin/bash

# Removendo travas eventuais do apt
sudo rm /var/lib/dpkg/lock-frontend;
sudo rm /var/cache/apt/archives/lock;

# Adicionando novos repositórios
sudo apt-add-repository ppa:graphics-drivers/ppa
sudo add-apt-repository ppa:git-core/ppa
sudo add-apt-repository ppa:shutter/ppa

sudo apt-get update

sudo apt-get install git -y
sudo apt-get install virtualbox -y
sudo apt-get install arduino -y
sudo apt install build-essential -y
sudo apt-get install manpages-dev -y
sudo apt-get install telegram -y
sudo apt-get install shutter -y
sudo apt-get install qbittorrent -y

# Instalando programas via snap
sudo apt install snapd -y

sudo snap install code --classic
sudo snap install insomnia
sudo snap install vlc
sudo snap install spotify

sudo snap install photogimp

# Fazendo download de programas externos

mkdir /home/${USER}/Downloads/softwares

cd /home/${USER}/Downloads/softwares

# chrome
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# discord
wget -c https://dl.discordapp.net/apps/linux/0.0.10/discord-0.0.10.deb

sudo dpkg -i *.deb


