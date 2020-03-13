#!/bin/bash

# Removendo travas eventuais do apt
sudo rm /var/lib/dpkg/lock-frontend;
sudo rm /var/cache/apt/archives/lock;

# Adicionando novos repositórios
sudo apt-add-repository ppa:graphics-drivers/ppa
sudo add-apt-repository ppa:git-core/ppa
sudo add-apt-repository ppa:shutter/ppa
sudo add-apt-repository ppa:openjdk-r/ppa
sudo add-apt-repository ppa:atareao/telegram
sudo add-apt-repository ppa:kdenlive/kdenlive-stable

sudo apt-get update

sudo apt-get install git -y
sudo apt-get install virtualbox -y
sudo apt-get install arduino -y
sudo apt install build-essential -y
sudo apt-get install manpages-dev -y
sudo apt-get install telegram -y
sudo apt-get install shutter -y
sudo apt-get install qbittorrent -y
sudo apt-get install g++ -y
sudo apt-get install kdenlive -y

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
wget -c https://dl.google.com/android/repository/commandlinetools-linux-6200805_latest.zip
sudo dpkg -i *.deb

# Ambiente React Native

sudo apt-get install zsh -y
sudo apt-get install curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g react-native-cli
sudo apt-get install openjdk-8-jdk
sudo npm install -g expo-cli
mkdir ~/Android/Sdk
unzip commandlinetools-linux-6200805_latest.zip -d ~Android/Sdk

echo Todo o script terminou, agora você precisa ir no arquivo .bashrc.
echo Agora, coloque essas 3 linhas no COMEÇO do arquivo.
echo && echo
echo export ANDROID_HOME=~/Android/Sdk
echo
echo export PATH=$PATH:$ANDROID_HOME/tools
echo
echo export PATH=$PATH:$ANDROID_HOME/platform-tools

echo Agora, execute este comando:
echo
echo ~/Android/Sdk/tools/bin/sdkmanager "platform-tools" "platforms;android-27" "build-tools;27.0.3" -y

echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="2717", MODE="0666", GROUP="plugdev"' | sudo tee /etc/udev/rules.d/51-android-usb.rules
