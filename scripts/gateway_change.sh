#!/bin/bash

source $CREDITCOIN_HOME_UNDER/.env

sed -i "s|$INFURA\",|$INFURA\"|g" $CREDITCOIN_HOME/gatewayConfig.json
