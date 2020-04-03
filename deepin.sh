cd ~

#!/bin/bash

# Removendo travas eventuais do apt
sudo rm /var/lib/dpkg/lock-frontend;
sudo rm /var/cache/apt/archives/lock;

# Permitindo que o sistema utilize repositórios
wget -c https://raw.githubusercontent.com/williamtorres1/ShellScript/master/add-apt-repository
sudo mv add-apt-repository /usr/sbin && sudo chmod o+x /usr/sbin/add-apt-repository && sudo chown root:root /usr/sbin/add-apt-repository


# Adicionando novos repositórios
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo add-apt-repository ppa:openjdk-r/ppa
sudo add-apt-repository ppa:atareao/telegram
sudo add-apt-repository ppa:kdenlive/kdenlive-stable

sudo apt-get update

sudo apt-get install curl -y
sudo apt-get install git -y
sudo apt-get install virtualbox -y
sudo apt-get install arduino -y
sudo apt-get install build-essential -y
sudo apt-get install manpages-dev -y
sudo apt-get install telegram -y
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
sudo mv commandlinetools-linux-6200805_latest.zip ~/Android/Sdk
sudo dpkg -i *.deb
cd ..
rm -Rf softwares

# Ambiente React Native
sudo snap install node --classic --channel=12
sudo npm install -g react-native-cli
sudo apt-get install openjdk-8-jdk
sudo npm install -g expo-cli
mkdir /home/${USER}/Android
mkdir /home/${USER}/Android/Sdk
cd /home/${USER}/Android/Sdk
unzip commandlinetools-linux-6200805_latest.zip
rm *.zip
cd ~
echo "export ANDROID_HOME=~/Android/Sdk" >> ./.bashrc
echo "export PATH=$PATH:$ANDROID_HOME/tools" >> ./.bashrc
echo "export PATH=$PATH:$ANDROID_HOME/platform-tools" >> ./.bashrc
~/Android/Sdk/tools/bin/sdkmanager "platform-tools" "platforms;android-27" "build-tools;27.0.3" -y
