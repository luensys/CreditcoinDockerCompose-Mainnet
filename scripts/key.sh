#!/bin/bash
echo "Miner(Priv)키" & docker exec sawtooth-validator-default cat /etc/sawtooth/keys/validator.priv
echo "pubilc 키" & docker exec sawtooth-validator-default cat /etc/sawtooth/keys/validator.pub
echo "sighash" & docker exec -it creditcoin-client ./ccclient sighash
