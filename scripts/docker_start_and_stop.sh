#!/bin/bash

docker-compose -f $CREDITCOIN_HOME/docker-compose.yaml up -d
docker-compose -f $CREDITCOIN_HOME/docker-compose.yaml down
