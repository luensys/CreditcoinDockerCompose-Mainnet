#!/bin/bash

(crontab -l 2>/dev/null; echo "")| crontab -
(crontab -l 2>/dev/null; echo "CREDITCOIN_HOME=~/work/CreditcoinDockerCompose-Mainnet/Server")| crontab -
(crontab -l 2>/dev/null; echo "CREDITCOIN_HOME_UNDER=~/work/CreditcoinDockerCompose-Mainnet")| crontab -
(crontab -l 2>/dev/null; echo "*/30 * * * * (cd $CREDITCOIN_HOME_UNDER && $CREDITCOIN_HOME_UNDER/restart.sh >> $CREDITCOIN_HOME_UNDER/crontab.log 2>&1)")| crontab -