#!/bin/sh
mkdir downloads_temporary
cd downloads_temporary

echo "\n>> Removendo travas eventuais do apt\n"
sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock

printf "\n >>> Instalando curl\n"
sudo apt install curl -y 

printf "\n >>> Adicionando repositório Node\n"
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -

printf "\n >>> Adcionando repositório Node Versiom Manager\n"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

printf "\n >>> Adicionando repositório Yarn\n"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

printf "\n >>> Adicionando repositório JDK 11\n"
sudo add-apt-repository ppa:openjdk-r/ppa -y

printf "\n >>> Adicionando GPG key Beekeeper\n"
printf "Install BKP Studio GPG key"
wget --quiet -O - https://deb.beekeeperstudio.io/beekeeper.key | sudo apt-key add -

printf "\n >>> Adicionando repositório do Beekeeper\n"
 echo "deb https://deb.beekeeperstudio.io stable main" | sudo tee /etc/apt/sources.list.d/beekeeper-studio-app.list

printf "\n >>> Adicionando repositório do Insomnia\n"
echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list

printf "\n >>> Atualizando repositórios\n"
sudo apt update

printf "\n >>> Instalando node\n"
sudo apt install -y nodejs

printf "\n >>> Versão node\n"
node -v

printf "\n >>> Versão npm\n"
npm -v

printf "\n >>> Clonando repositório NVM \n"
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

printf "\n >>> Instalando NVM\n"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

printf "\n >>> Instalando Yarn\n"
sudo apt install --no-install-recommends yarn -y

printf "\n >>> Versão yarn\n"
yarn -v

printf "\n >>> Instalando JDK 11\n"
sudo apt-get install openjdk-11-jdk -y

printf "\n >>> Versão Java\n"
java -version

printf "\n >>> Instalando libs gráficas para emulação\n"
sudo apt install gcc-multilib lib32z1 lib32stdc++6 -y

printf "\n >>> Instalando KVM\n"
sudo apt install qemu-kvm -y

printf "\n >>> Instalando Insomnia\n"
sudo apt install insomnia -y

printf "\n >>> Instalando git\n"
sudo apt install git -y

printf "\n >>> Configurações git\n"
git config --global user.name "William Torres"
git config --global user.email "contatowilliamtorres@gmail.com"

printf "\n >>> Instalando Beekeeper Studio\n"
sudo apt install beekeeper-studio -y

printf "\n >>> Instalando zsh\n"
sudo apt install zsh -y

printf "\n >>> Versão ZSH\n"
zsh --version

printf "\n >>> Instalando Docker\n"
sudo apt remove docker docker-engine docker.io -y
sudo apt install docker.io -y

printf "\n >>> Iniciar o docker junto ao sistema\n"
sudo systemctl start docker
sudo systemctl enable docker

printf "\n >>> Adicionando permissões de sudo ao docker\n"
sudo groupadd docker
sudo usermod -aG docker $USER

printf "\n >>> Logout and login back, then run: newgrp docker\n"

printf "\n >>> Baixando Discord\n"
wget -c https://dl.discordapp.net/apps/linux/0.0.14/discord-0.0.14.deb

printf "\n >>> Baixando Vivaldi\n"
wget -c https://downloads.vivaldi.com/stable/vivaldi-stable_3.7.2218.58-1_amd64.deb

printf "\n >>> Baixando DBeaver\n"
wget -c https://download.dbeaver.com/community/21.0.3/dbeaver-ce_21.0.3_amd64.deb

printf "\n >>> Baixando Visual Studio Code\n"
wget -c https://az764295.vo.msecnd.net/stable/3c4e3df9e89829dce27b7b5c24508306b151f30d/code_1.55.2-1618307277_amd64.deb

printf "\n >>> Instalando todos os .deb\n"
sudo dpkg -i *.deb

printf "\n >>> Baixando Watchman\n"
wget -c https://github.com/facebook/watchman/releases/download/v2021.07.05.00/watchman-v2021.07.05.00-linux.zip
unzip watchman-v2021.07.05.00-linux.zip
cd watchman-v2021.07.05.00-linux
sudo mkdir -p /usr/local/{bin,lib} /usr/local/var/run/watchman;
sudo cp bin/* /usr/local/bin;
sudo cp lib/* /usr/local/lib
sudo chmod 755 /usr/local/bin/watchman
sudo chmod 2777 /usr/local/var/run/watchman

printf "\n >>> Instalando expo\n"
yarn global add expo-cli

cd .. 
rm -rf downloads_temporary

printf "\n >>> Adicionando $USER ao grupo KVM\n"
sudo adduser $USER kvm

printf "\n >>> Baixando android studio\n"
wget -c https://r2---sn-bg0ezn7z.gvt1.com/edgedl/android/studio/ide-zips/4.1.3.0/android-studio-ide-201.7199119-linux.tar.gz?mh=QN&mvi=2&pl=24&shardbypass=yes&redirect_counter=1&cm2rm=sn-pouxgapb5qvncg-j50e7l&req_id=6b940ead4e885c5d&cms_redirect=yes&mip=170.247.211.108&mm=42&mn=sn-bg0ezn7z&ms=onc&mt=1619644559&mv=u

printf "\n >>> Baixando flipper\n"
wget -c https://www.facebook.com/fbflipper/public/linux

exit
