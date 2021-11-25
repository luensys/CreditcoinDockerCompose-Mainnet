#!/bin/bash

sed -i "s/sudo \$DOCKER_COMPOSE/\$DOCKER_COMPOSE/g" $CREDITCOIN_HOME/start_creditcoin.sh
sed -i "s/sudo docker network prune -f/docker network prune -f/g" $CREDITCOIN_HOME/start_creditcoin.sh