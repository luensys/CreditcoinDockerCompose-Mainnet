#!/bin/bash

/bin/echo "서버를 재기동합니다..."
# Server shutdown
/usr/local/bin/docker-compose -f /home/happymine/CreditCoin/Client/docker-compose.yaml down
sleep 1
/usr/local/bin/docker-compose -f /home/happymine/CreditCoin/Server/docker-compose.yaml down
sleep 1

# Take snapshot
DATEX=$(/bin/date +%y%m%d_%H%M%S)
TargetFile="/home/happymine/snapshot/CTC_Snapshot_$DATEX.tar.gz"
/bin/tar -I pigz -Scf $TargetFile -P /var/lib/docker/volumes/server_validator-block-volume/_data/ 
sleep 1

# Server Up
/usr/local/bin/docker-compose -f /home/happymine/CreditCoin/Server/docker-compose.yaml up -d
sleep 1
/usr/local/bin/docker-compose -f /home/happymine/CreditCoin/Client/docker-compose.yaml up -d
sleep 1

# 해제
# tar -I pigz -xvf <저장한 디렉토리>/CTC_Snapshot_210118_121212.tar.gz -P /var/lib/docker/volumes/server_validator-block-volume/
