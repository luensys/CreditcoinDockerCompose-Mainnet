#!/bin/bash

# docker install
sudo apt-get update
sudo apt-get -y install \
  ca-certificates \
  curl \
  gnupg \
  lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# docker group add
sudo groupadd docker
sudo usermod -aG docker $USER
sudo chmod 666 /var/run/docker.sock
sudo service docker restart

# docker-compose install
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# g++-7 install
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test

sudo apt update
sudo apt install g++-7 -y

# bashrc에 CREDITCOIN_HOME 추가
~/work/CreditcoinDockerCompose-Mainnet/scripts/first.sh

# 멀티테스킹 빌드
cd ~/work/CreditcoinDockerCompose-Mainnet/Server
./build.sh

# 빌드 후 모든 라이브러리 업그레이드
sudo apt upgrade -y
