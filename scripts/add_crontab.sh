#!/bin/bash

(crontab -l 2>/dev/null; echo "")| crontab -
(crontab -l 2>/dev/null; echo "CREDITCOIN_HOME_UNDER=$CREDITCOIN_HOME_UNDER")| crontab -
(crontab -l 2>/dev/null; echo "*/30 * * * * (cd $CREDITCOIN_HOME_UNDER && $CREDITCOIN_HOME_UNDER/scripts/restart.sh >> $CREDITCOIN_HOME_UNDER/crontab.log 2>&1)")| crontab -