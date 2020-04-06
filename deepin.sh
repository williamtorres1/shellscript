cd ~

#!/bin/bash

# Removendo travas eventuais do apt
sudo rm /var/lib/dpkg/lock-frontend;
sudo rm /var/cache/apt/archives/lock;

# Permitindo que o sistema utilize repositórios
wget -c https://raw.githubusercontent.com/williamtorres1/ShellScript/master/add-apt-repository
sudo mv add-apt-repository /usr/sbin && sudo chmod o+x /usr/sbin/add-apt-repository && sudo chown root:root /usr/sbin/add-apt-repository

# Node
sudo curl -sL https://deb.nodesource.com/setup_12.x | bash -
# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Adicionando novos repositórios
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo add-apt-repository ppa:openjdk-r/ppa
sudo add-apt-repository ppa:atareao/telegram
sudo add-apt-repository ppa:kdenlive/kdenlive-stable

sudo apt-get update

sudo apt-get install -y nodejs
sudo apt-get install --no-install-recommends yarn -y
sudo apt-get install openjdk-8-jdk -y
sudo apt-get install insomnia -y
sudo apt-get install curl -y
sudo apt-get install git -y
sudo apt-get install scrcpy -y
sudo apt-get install virtualbox -y
sudo apt-get install arduino -y
sudo apt-get install build-essential -y
sudo apt-get install manpages-dev -y
sudo apt-get install telegram -y
sudo apt-get install qbittorrent -y
sudo apt-get install g++ -y
sudo apt-get install kdenlive -y

# Fazendo download de programas externos
mkdir /home/${USER}/Downloads/softwares
cd /home/${USER}/Downloads/softwares
# discord
wget -c https://dl.discordapp.net/apps/linux/0.0.10/discord-0.0.10.deb
# Insomnia
wget -c https://github-production-release-asset-2e65be.s3.amazonaws.com/56899284/e217bd00-5296-11ea-98da-f03d5d4bdcc8?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20200406%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20200406T233856Z&X-Amz-Expires=300&X-Amz-Signature=a13dc558b352805217cf035a660736ba688ce406744e7cdbdf095177355ffc4c&X-Amz-SignedHeaders=host&actor_id=39351781&response-content-disposition=attachment%3B%20filename%3Dinsomnia_7.1.1_amd64.deb&response-content-type=application%2Foctet-stream
sudo dpkg -i *.deb
cd ..
rm -Rf softwares

# Ambiente React Native
sudo npm install -g react-native-cli
sudo npm install -g expo-cli
mkdir /home/${USER}/Android
mkdir /home/${USER}/Android/Sdk
cd /home/${USER}/Android/Sdk
wget -c https://dl.google.com/android/repository/commandlinetools-linux-6200805_latest.zip
unzip commandlinetools-linux-6200805_latest.zip
rm *.zip
cd ~
echo "export ANDROID_HOME=~/Android/Sdk" >> ./.bashrc
echo "export PATH=$PATH:$ANDROID_HOME/tools" >> ./.bashrc
echo "export PATH=$PATH:$ANDROID_HOME/platform-tools" >> ./.bashrc
~/Android/Sdk/tools/bin/sdkmanager "platform-tools" "platforms;android-27" "build-tools;27.0.3" -y

sudo apt-get update
sudo apt-get upgrade -y
reboot
