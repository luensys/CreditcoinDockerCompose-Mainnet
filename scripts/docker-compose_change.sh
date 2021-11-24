#!/bin/bash

source $CREDITCOIN_HOME_UNDER/.env

sed -i "s|- 8800|- $PORT|g" $CREDITCOIN_HOME/docker-compose.yaml
sed -i "s|tcp:\/\/\[insert.your.ip\]:8800|tcp:\/\/$IP_ADDR:$PORT|g" $CREDITCOIN_HOME/docker-compose.yaml
