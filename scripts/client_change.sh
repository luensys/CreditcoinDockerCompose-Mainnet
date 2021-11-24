#!/bin/bash

source $CREDITCOIN_HOME_UNDER/.env

sed -i "s/<256_bit_key_secp256k1_ECDSA>/$PRIV_KEY/g" $CREDITCOIN_HOME_UNDER/clientConfig.json
sed -i "s/<ethereum_node_url>/$INFURA/g" $CREDITCOIN_HOME_UNDER/clientConfig.json
sed -i "s/<ethereum_private_key_no_0x>/$SECRET_KEY/g" $CREDITCOIN_HOME_UNDER/clientConfig.json