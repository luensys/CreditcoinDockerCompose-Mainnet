#!/bin/bash

source ~/.env

docker-compose -f $CREDITCOIN_HOME_UNDER/Server/docker-compose.yaml down

sudo bash -c "rm /var/lib/docker/volumes/server_validator-block-volume/_data/*"

sudo tar xzvf $SNAPSHOT_DIR/$SNAPSHOT_FILE --directory /var/lib/docker/volumes/server_validator-block-volume/