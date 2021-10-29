#!/bin/bash
# start monitoring


if  screen -ls | grep -q mon  ; then
    screen -r mon 
else
    screen -S mon ~/CreditCoin/tools/monitor.sh -f -n 30
fi
