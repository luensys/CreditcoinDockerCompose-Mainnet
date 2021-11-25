#!/bin/bash

CREDITCOIN_HOME=~/work/CreditcoinDockerCompose-Mainnet/Server
CREDITCOIN_HOME_UNDER=~/work/CreditcoinDockerCompose-Mainnet

echo '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<'
date
echo 'miner up'

echo -ne '\n' | $CREDITCOIN_HOME_UNDER/Server/start_creditcoin.sh
docker-compose -f $CREDITCOIN_HOME_UNDER/Client/docker-compose.yaml up -d

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo '\n'