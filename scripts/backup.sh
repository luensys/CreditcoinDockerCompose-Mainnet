#!/bin/bash

cd ~/work/CreditcoinDockerCompose-Mainnet/scripts
./down.sh

cp ~/work/CreditcoinDockerCompose-Mainnet/Server/docker-compose.yaml ~/work/CreditcoinDockerCompose-Mainnet/Server/docker-compose.yaml.bak
cp ~/work/CreditcoinDockerCompose-Mainnet/Server/gatewayConfig.json ~/work/CreditcoinDockerCompose-Mainnet/Server/gatewayConfig.json.bak
cp ~/work/CreditcoinDockerCompose-Mainnet/Client/docker-compose.yaml ~/work/CreditcoinDockerCompose-Mainnet/Client/docker-compose.yaml.bak
cp ~/work/CreditcoinDockerCompose-Mainnet/Client/clientConfig.json ~/work/CreditcoinDockerCompose-Mainnet/Client/clientConfig.json.bak

mv ~/CreditcoinDockerCompose-Mainnet ~/CreditcoinDockerCompose-Mainnet.bak
