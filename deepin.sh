cd ~

#!/bin/bash

# Removendo travas eventuais do apt
echo ">> Removendo travas eventuais do apt"
sudo rm /var/lib/dpkg/lock-frontend;
sudo rm /var/cache/apt/archives/lock;

# Permitindo que o sistema utilize repositórios
echo ">> Permitindo que o sistema utilize repositórios"
wget -c https://raw.githubusercontent.com/williamtorres1/ShellScript/master/add-apt-repository
sudo mv add-apt-repository /usr/sbin && sudo chmod o+x /usr/sbin/add-apt-repository && sudo chown root:root /usr/sbin/add-apt-repository
echo ">> Instando curl"
sudo apt-get install curl -y

# Node
echo ">> Adicionando repositório Node.JS"
sudo curl -sL https://deb.nodesource.com/setup_12.x | bash -
# Yarn
echo ">> Adicionando repositório Yarn"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Adicionando novos repositórios
echo ">> Adicionando novos repositórios ppa"
sudo add-apt-repository ppa:openjdk-r/ppa
sudo add-apt-repository ppa:atareao/telegram
sudo add-apt-repository ppa:kdenlive/kdenlive-stable
sudo add-apt-repository ppa:ehbello/fritzing
sudo add-apt-repository ppa:menulibre-dev/daily

echo ">> Atualizando"

sudo apt-get update

echo ">> Instalando Node.JS"
sudo apt-get install -y nodejs
echo ">> Instalando qemu-kvm"
sudo apt install qemu-kvm -y
echo ">> Instalando Fritzing"
sudo apt-get install fritzing -y
sudo adduser $USER kvm
echo ">> Instalando yarn"
sudo apt-get install --no-install-recommends yarn -y
echo ">> Instalando jdk8"
sudo apt-get install openjdk-8-jdk -y
sudo apt-get install gcc-multilib lib32z1 lib32stdc++6 -y
echo ">> Instalando git"
sudo apt-get install git -y
echo ">> Instalando virtualbox"
sudo apt-get install virtualbox -y
#sudo apt-get install arduino -y
sudo apt-get install build-essential -y
sudo apt-get install manpages-dev -y
echo ">> Instalando qbitTorrent"
sudo apt-get install qbittorrent -y
echo ">> Instalando compilador g++"
sudo apt-get install g++ -y
echo ">> Instalando menulibre"
sudo apt-get install menulibre -y
#sudo apt-get install kdenlive -y

# Fazendo download de programas externos
mkdir /home/${USER}/Downloads/softwares
cd /home/${USER}/Downloads/softwares
# Discord
echo ">> Baixando Discord"
wget -c https://dl.discordapp.net/apps/linux/0.0.10/discord-0.0.10.deb
# Insomnia
echo ">> Baixando Imsomnia"
wget -c https://github-production-release-asset-2e65be.s3.amazonaws.com/56899284/e217bd00-5296-11ea-98da-f03d5d4bdcc8?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20200527%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20200527T201808Z&X-Amz-Expires=300&X-Amz-Signature=aebac78712419d3a087b63a3d29d96c642861bb140a15bd6b647ade2486c90b7&X-Amz-SignedHeaders=host&actor_id=39351781&repo_id=56899284&response-content-disposition=attachment%3B%20filename%3Dinsomnia_7.1.1_amd64.deb&response-content-type=application%2Foctet-stream
# VisualStudioCode
echo ">> Baixando VSCode"
wget -c https://az764295.vo.msecnd.net/stable/5763d909d5f12fe19f215cbfdd29a91c0fa9208a/code_1.45.1-1589445302_amd64.deb
# 4kVideoDownloader
echo ">> Baixando 4kVideoDownloader"
wget -c https://dl.4kdownload.com/app/4kvideodownloader_4.12.0-1_amd64.deb?source=website

echo ">> Instalando arquivos .deb"
sudo dpkg -i *.deb
eccho ">> Removendo arquivos .deb"
rm *.deb

# Telegram
echo ">> Baixando Telegram";
wget -c https://updates.tdesktop.com/tlinux/tsetup.2.1.7.tar.xz
# Arduino
echo ">> Baixando Arduino"
wget -c https://downloads.arduino.cc/arduino-1.8.12-linux64.tar.xz

echo ">> Descompactando..."
tar -xvf *.tar.xz
echo ">> Removendo arquivos .tar.xz"
rm *.tar.xz

echo ">> Instalando Arduino"
cd arduino-1.8.12
./install.sh

echo ">> Baixando Driver da Placa de vídeo"
wget -c http://us.download.nvidia.com/XFree86/Linux-x86_64/340.108/NVIDIA-Linux-x86_64-340.108.run
cd ..
#rm -Rf softwares

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
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

sudo apt-get update
sudo apt-get upgrade -y
reboot
