#!/bin/bash

PRIV_KEY=$(sudo head -n 1 /var/lib/docker/volumes/server_validator-key-volume/_data/validator.priv)
PUB_KEY=$(sudo head -n 1 /var/lib/docker/volumes/server_validator-key-volume/_data/validator.pub)

sed -i "s/private_key/$PRIV_KEY/g" ~/.env
sed -i "s/public_key/$PUB_KEY/g" ~/.env