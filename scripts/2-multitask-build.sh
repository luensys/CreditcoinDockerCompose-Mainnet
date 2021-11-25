#!/bin/bash

# 멀티테스킹 빌드
rm -rf ~/cryptopp_sha
cd ~/work/CreditcoinDockerCompose-Mainnet/Server
./build.sh

# 빌드 후 모든 라이브러리 업그레이드
sudo apt upgrade -y
