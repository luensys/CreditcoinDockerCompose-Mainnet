#!/bin/bash

echo "cat ~/work/CreditcoinDockerCompose-Mainnet/crontab.log" > ~/check.sh
echo "rm -rf ~/work/CreditcoinDockerCompose-Mainnet/crontab.log" >> ~/check.sh
echo "~/work/CreditcoinDockerCompose-Mainnet/scripts/block.sh" >> ~/check.sh

chmod 755 ~/check.sh