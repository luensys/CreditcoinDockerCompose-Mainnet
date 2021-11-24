#!/bin/bash

echo '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<'
date
echo 'miner down'

docker-compose -f $CREDITCOIN_HOME_UNDER/Client/docker-compose.yaml down
echo -ne '\n' | $CREDITCOIN_HOME_UNDER/Server/start_creditcoin.sh -s

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo '\n'