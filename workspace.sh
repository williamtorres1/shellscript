sudo apt-get install curl -y 
echo
echo "Instalando curl"
echo
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
echo
echo ">>> Adicionando repositório Node"
echo
sudo apt-get install -y nodejs
echo
node -v
echo ">>> Versão do node"
echo
npm -v
echo ">>> Versão do npm"
echo

echo ">>> Adicionando repositório Yarn"
echo
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

echo 
echo ">>> Adicionando repositório JDK 8"
echo
sudo add-apt-repository ppa:openjdk-r/ppa

echo
echo ">>> Atualizando repositórios"
sudo apt-get update -y

echo
echo ">>> Instalando Yarn"
echo 
sudo apt install --no-install-recommends yarn -y
echo
yarn -v
echo ">>> Versão do yarn"
echo

echo
echo ">>> Instalando React Native"
echo
sudo yarn global add react-native-cli
echo
react-native -v
echo ">>> Versão do React Native CLI"
echo

echo
echo ">>> Instalando expo"
yarn global add expo-cli

echo
echo ">>> Instalando JDK 8"
sudo apt-get install openjdk-8-jdk

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
