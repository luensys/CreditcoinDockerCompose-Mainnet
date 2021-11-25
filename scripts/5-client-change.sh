#!/bin/bash

source ~/.env

sed -i "s|<256_bit_key_secp256k1_ECDSA>|$PRIV_KEY|g" $CREDITCOIN_HOME_UNDER/Client/clientConfig.json
sed -i "s|<ethereum_node_url>|$INFURA|g" $CREDITCOIN_HOME_UNDER/Client/clientConfig.json
sed -i "s|<ethereum_private_key_no_0x>|$SECRET_KEY|g" $CREDITCOIN_HOME_UNDER/Client/clientConfig.json
