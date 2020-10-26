echo
echo "Instalando curl"
echo
sudo apt-get install curl -y 

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
echo
echo ">>> Adicionando repositório Node"
echo

echo ">>> Adicionando repositório Yarn"
echo
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

echo 
echo ">>> Adicionando repositório JDK 8"
echo
sudo add-apt-repository ppa:openjdk-r/ppa -y

echo
echo ">>> Adicionando repositório Insomnia"

echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list

echo
echo ">>> Adicionando chave pública para verificar assinatura Insomnia"
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
    | sudo apt-key add -

echo
echo ">>> Instalando Beekeeper Studio"
echo
# Install BKP Studio GPG key
wget --quiet -O - https://bintray.com/user/downloadSubjectPublicKey?username=bintray | sudo apt-key add -
# add BKP Studio repo to apt lists directory
echo "deb https://dl.bintray.com/beekeeper-studio/releases disco main" | sudo tee /etc/apt/sources.list.d/beekeeper-studio.list

echo
echo ">>> Atualizando repositórios"
sudo apt-get update

echo
echo ">>> Instalando node"
echo
sudo apt-get install -y nodejs

echo ">>> Versão do node"
echo
node -v

echo ">>> Versão do npm"
echo
npm -v

echo
echo ">>> Instalando Yarn"
echo 
sudo apt install --no-install-recommends yarn -y
echo
yarn -v
echo ">>> Versão do yarn"
echo

echo
echo ">>> Instalando expo"
yarn global add expo-cli

echo
echo ">>> Instalando JDK 8"
sudo apt-get install openjdk-8-jdk -y

echo
echo ">>> Versão do Java"
java -version

echo
echo ">>> Instalando libs gráficas para emulação"
echo
sudo apt-get install gcc-multilib lib32z1 lib32stdc++6 -y

echo
echo ">>> Instalando KVM"
echo
sudo apt install qemu-kvm -y

echo
echo ">>> Instalando Insomnia"
echo
sudo apt-get install insomnia -y

echo
echo ">>> Instalando git"
echo
sudo apt-get install git -y

echo
echo ">>> Configurações git"
echo
git config --global user.name "William Torres"
git config --global user.email "contatowilliamtorres@gmail.com"

echo
echo ">>> Instalando Beekeeper Studio"
echo
sudo apt install beekeeper-studio -y


echo
echo ">>> Instalando fira-code"
echo
sudo apt install fonts-firacode -y

echo
echo ">>> Instalando Docker"
echo
sudo apt remove docker docker-engine docker.io -y
sudo apt install docker.io -y

echo
echo ">>> Iniciar o docker junto ao sistema"
echo
sudo systemctl start docker
sudo systemctl enable docker

echo
echo ">>> Adicionando permissões de sudo ao docker"
echo
sudo groupadd docker
sudo usermod -aG docker $USER

echo
echo ">>> Logout and login back, then run"
echo
echo "newgrp docker"

echo
echo ">>> Baixando Discord"
echo
wget -c https://dl.discordapp.net/apps/linux/0.0.12/discord-0.0.12.deb


echo
echo ">>> Baixando Chrome"
echo
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb


echo
echo ">>> Baixando DBeaver"
echo
wget -c https://dbeaver.io/files/7.2.3/dbeaver-ce_7.2.3_amd64.deb



echo
echo ">>> Baixando Visual Studio Code"
echo
wget -c https://az764295.vo.msecnd.net/stable/d2e414d9e4239a252d1ab117bd7067f125afd80a/code_1.50.1-1602600906_amd64.deb

echo
echo ">>> Instalando todos os .deb"
sudo dpkg -i *.deb

rm *.deb

echo
echo ">>> Instalando zsh"
echo
sudo apt install zsh -y

echo
echo ">>> Versão do ZSH"
echo
zsh --version

echo
echo ">>> Make it your default shell"
echo
sudo chsh -s $(which zsh)

echo
echo ">>> Instalando oh-my-zsh"
echo
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y

exit

echo
echo ">>> Instalando spaceship prompt"
echo
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme" 

echo
echo
echo ">>> Now Set ZSH_THEME="spaceship" in your .zshrc."
echo
echo

