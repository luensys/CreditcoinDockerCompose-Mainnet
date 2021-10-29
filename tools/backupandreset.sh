#!/bin/bash
cp ~/CreditCoin/Server/docker-compose.yaml ~/CreditCoin/Server/docker-compose.yaml.bak
cp ~/CreditCoin/Server/gatewayConfig.json ~/CreditCoin/Server/gatewayConfig.json.bak
cp ~/CreditCoin/Client/docker-compose.yaml ~/CreditCoin/Client/docker-compose.yaml.bak
cp ~/CreditCoin/Client/clientConfig.json ~/CreditCoin/Client/clientConfig.json.bak

mv ~/CreditCoin ~/CreditCoin.bak 
git clone https://github.com/odeothx/CreditcoinDockerCompose-Mainnet CreditCoin
cp -r ~/CreditCoin.bak/Server/* ~/CreditCoin/Server
cp -r ~/CreditCoin.bak/Client/* ~/CreditCoin/Client
