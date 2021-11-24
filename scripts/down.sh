#!/bin/bash

echo '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<'
date
echo 'miner down'

docker-compose -f $CREDITCOIN_HOME_UNDER/Client/docker-compose.yaml down
echo -ne '\n' | $CREDITCOIN_HOME_UNDER/Server/start_creditcoin_mine.sh -s

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo '\n'