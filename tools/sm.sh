#!/bin/bash
# start monitoring


if  screen -ls | grep -q mon  ; then
    screen -r mon 
else
    screen -S mon ~/CreditCoin/monitor.sh 
fi
