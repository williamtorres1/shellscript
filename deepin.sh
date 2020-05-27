cd ~

#!/bin/bash

# Removendo travas eventuais do apt
echo ">> Removendo travas eventuais do apt"
sudo rm /var/lib/dpkg/lock-frontend;
sudo rm /var/cache/apt/archives/lock;
echo
# Permitindo que o sistema utilize repositórios
echo ">> Permitindo que o sistema utilize repositórios"
echo
wget -c https://raw.githubusercontent.com/williamtorres1/ShellScript/master/add-apt-repository
sudo mv add-apt-repository /usr/sbin && sudo chmod o+x /usr/sbin/add-apt-repository && sudo chown root:root /usr/sbin/add-apt-repository
echo
echo ">> Instando curl"
echo
echo
sudo apt-get install curl -y

# Node
echo
echo ">> Adicionando repositório Node.JS"
echo
sudo curl -sL https://deb.nodesource.com/setup_12.x | bash -
# Yarn
echo
echo ">> Adicionando repositório Yarn"
echo
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Insomnia
echo
echo ">> Adicionando repositório Insomnia"
echo
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
    | sudo apt-key add -

# Adicionando novos repositórios
echo
echo ">> Adicionando novos repositórios ppa"
echo
sudo add-apt-repository ppa:openjdk-r/ppa
sudo add-apt-repository ppa:ehbello/fritzing
sudo add-apt-repository ppa:menulibre-dev/daily

echo
echo ">> Atualizando"
echo

sudo apt-get update

sudo apt --fix-broken install -y
echo
echo ">> Instalando Node.JS"
echo
sudo apt-get install -y nodejs

echo
echo ">> Instalando qemu-kvm"
echo
sudo apt install qemu-kvm -y

echo
echo ">> Instalando Fritzing"
echo
sudo apt-get install fritzing -y
sudo adduser $USER kvm
echo
echo ">> Instalando yarn"
echo
sudo apt-get install --no-install-recommends yarn -y

echo
echo ">> Instalando jdk8"
echo
sudo apt-get install openjdk-8-jdk -y
sudo apt-get install gcc-multilib lib32z1 lib32stdc++6 -y

echo
echo ">> Baixando Imsomnia"
echo
sudo apt-get install insomnia -y

echo
echo ">> Instalando git"
sudo apt-get install git -y
echo

echo
echo ">> Instalando virtualbox"
sudo apt-get install virtualbox -y
echo
sudo apt-get install build-essential -y
sudo apt-get install manpages-dev -y

echo
echo ">> Instalando qbitTorrent"
sudo apt-get install qbittorrent -y
echo

echo
echo ">> Instalando compilador g++"
echo
sudo apt-get install g++ -y

echo
echo ">> Instalando menulibre"
echo
sudo apt-get install menulibre -y
#sudo apt-get install kdenlive -y

# Fazendo download de programas externos
mkdir /home/william/Downloads/softwares
cd /home/william/Downloads/softwares
# Discord
echo
echo ">> Baixando Discord"
echo
wget -c https://dl.discordapp.net/apps/linux/0.0.10/discord-0.0.10.deb

# VisualStudioCode
echo
echo ">> Baixando VSCode"
echo
wget -c https://az764295.vo.msecnd.net/stable/5763d909d5f12fe19f215cbfdd29a91c0fa9208a/code_1.45.1-1589445302_amd64.deb
# 4kVideoDownloader
echo
echo ">> Baixando 4kVideoDownloader"
echo
wget -c https://dl.4kdownload.com/app/4kvideodownloader_4.12.0-1_amd64.deb

echo
echo ">> Instalando arquivos .deb"
echo
sudo dpkg -i *.deb
echo
eccho ">> Removendo arquivos .deb"
echo
rm *.deb

# Telegram
echo
echo ">> Baixando Telegram";
echo
wget -c https://updates.tdesktop.com/tlinux/tsetup.2.1.7.tar.xz
# Arduino
echo
echo ">> Baixando Arduino"
echo
wget -c https://downloads.arduino.cc/arduino-1.8.12-linux64.tar.xz

echo
echo ">> Descompactando..."
echo
tar -xvf *.tar.xz
echo
echo ">> Removendo arquivos .tar.xz"
echo
rm *.tar.xz

echo
echo ">> Instalando Arduino"
echo
cd arduino-1.8.12
./install.sh

echo
echo ">> Baixando Driver da Placa de vídeo"
echo
wget -c http://us.download.nvidia.com/XFree86/Linux-x86_64/340.108/NVIDIA-Linux-x86_64-340.108.run
chmod u=rwx NVIDIA-Linux-x86_64-340.108.run
echo
echo ">> Instalando driver da placa de vídeo"
echo
./NVIDIA-Linux-x86_64-340.108.run
cd ..
#rm -Rf softwares

# Ambiente React Native
echo
echo ">> Instalando React Native CLI"
echo
sudo npm install -g react-native-cli

echo
echo ">> Instalando Expo CLI"
echo
sudo npm install -g expo-cli
mkdir /home/william/Android
mkdir /home/william/Android/Sdk
cd /home/william/Android/Sdk
echo
echo ">> Baixando Android SDK Command line too"
echo
wget -c https://dl.google.com/android/repository/commandlinetools-linux-6200805_latest.zip
unzip commandlinetools-linux-6200805_latest.zip
rm *.zip
cd ~
echo "export ANDROID_HOME=~/Android/Sdk" >> ./.bashrc
echo "export PATH=$PATH:$ANDROID_HOME/tools" >> ./.bashrc
echo "export PATH=$PATH:$ANDROID_HOME/platform-tools" >> ./.bashrc
~/Android/Sdk/tools/bin/sdkmanager "platform-tools" "platforms;android-27" "build-tools;27.0.3" -y
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

sudo apt-get update
sudo apt-get upgrade -y
reboot
