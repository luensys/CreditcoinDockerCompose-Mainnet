#!/bin/bash

source $CREDITCOIN_HOME_UNDER/.env

echo "$PRIV_KEY" > /var/lib/docker/volumes/server_validator-key-volume/_data/validator.priv
echo "$PUB_KEY" > /var/lib/docker/volumes/server_validator-key-volume/_data/validator.pub