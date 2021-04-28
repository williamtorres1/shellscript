#!/bin/sh
mkdir downloads_temporary
cd downloads_temporary

echo "\n>> Removendo travas eventuais do apt\n"
sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock

printf "\n >>> Instalando curl\n"
sudo apt-get install curl -y 

printf "\n >>> Adicionando repositório Node\n"
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -

printf "\n >>> Adcionando repositório Node Versiom Manager\n"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

printf "\n >>> Adicionando repositório Yarn\n"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
printf "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

printf "\n >>> Adicionando repositório JDK 8\n"
sudo add-apt-repository ppa:openjdk-r/ppa -y

printf "\n >>> Adicionando repositório Insomnia\n"
printf "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list

printf "\n >>> Adicionando chave pública para verificar assinatura Insomnia\n"
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
    | sudo apt-key add -

printf "\n >>> Adicionando GPG key Beekeeper\n"
 Install BKP Studio GPG key
wget --quiet -O - https://bintray.com/user/downloadSubjectPublicKey?username=bintray | sudo apt-key add -
 add BKP Studio repo to apt lists directory
printf "\n >>> Adicionando repositório do Beekeeper\n"
printf "deb https://dl.bintray.com/beekeeper-studio/releases disco main" | sudo tee /etc/apt/sources.list.d/beekeeper-studio.list

printf
printf "\n >>> Atualizando repositórios\n"
sudo apt-get update

printf "\n >>> Instalando node\n"
sudo apt-get install -y nodejs

printf "\n >>> Versão node\n"
node -v

printf "\n >>> Versão npm\n"
npm -v

printf "\n >>> Instalando Yarn\n"
sudo apt install --no-install-recommends yarn -y

printf "\n >>> Versão yarn\n"
yarn -v

printf "\n >>> Instalando JDK 8\n"
sudo apt-get install openjdk-8-jdk -y

printf "\n >>> Versão Java\n"
java -version

printf "\n >>> Instalando libs gráficas para emulação\n"
sudo apt-get install gcc-multilib lib32z1 lib32stdc++6 -y

printf "\n >>> Instalando KVM\n"
sudo apt install qemu-kvm -y

printf "\n >>> Instalando Insomnia\n"
sudo apt-get install insomnia -y

printf "\n >>> Instalando git\n"
sudo apt-get install git -y

printf "\n >>> Configurações git\n"
git config --global user.name "William Torres"
git config --global user.email "contatowilliamtorres@gmail.com"

printf "\n >>> Instalando Beekeeper Studio\n"
sudo apt install beekeeper-studio -y

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

printf "\n >>> Baixando Chrome\n"
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

printf "\n >>> Baixando Vivaldi\n"
wget -c https://downloads.vivaldi.com/stable/vivaldi-stable_3.7.2218.58-1_amd64.deb

printf "\n >>> Baixando DBeaver\n"
wget -c https://download.dbeaver.com/community/21.0.3/dbeaver-ce_21.0.3_amd64.deb

printf "\n >>> Baixando Visual Studio Code\n"
wget -c https://az764295.vo.msecnd.net/stable/3c4e3df9e89829dce27b7b5c24508306b151f30d/code_1.55.2-1618307277_amd64.deb

printf "\n >>> Instalando todos os .deb\n"
sudo dpkg -i *.deb

printf "\n >>> Preventing error  ENOSPC: System limit for number of file watchers reached, watch\n"
printf fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

printf "\n >>> Instalando zsh\n"
sudo apt install zsh -y

printf "\n >>> Versão ZSH\n"
zsh --version

printf "\n >>> Baixando android studio\n"
wget -c https://r2---sn-bg0ezn7z.gvt1.com/edgedl/android/studio/ide-zips/4.1.3.0/android-studio-ide-201.7199119-linux.tar.gz?mh=QN&mvi=2&pl=24&shardbypass=yes&redirect_counter=1&cm2rm=sn-pouxgapb5qvncg-j50e7l&req_id=6b940ead4e885c5d&cms_redirect=yes&mip=170.247.211.108&mm=42&mn=sn-bg0ezn7z&ms=onc&mt=1619644559&mv=u

printf "\n >>> Instalando expo\n"
yarn global add expo-cli

cd ..
rm -Rf downloads_temporary

exit