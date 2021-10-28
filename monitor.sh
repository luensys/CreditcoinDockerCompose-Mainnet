#!/bin/bash


function timestamp {
  local ts=`date +"%Y-%m-%d %H:%M:%S"`
  echo -n $ts
}

function run_creditcoin_client {
	
	` docker container ls |  grep -q 'creditcoin-client'` ||
		docker-compose -f ~/CreditCoin/Client/docker-compose.yaml up -d	
	
}

function get_block_tip {
  curl -m 60 http://$REST_API_ENDPOINT/blocks?limit=1 2>/dev/null | grep -o '"block_num": "[^"]*' | cut -d'"' -f4
  return $?
}


[ -z $REST_API_ENDPOINT ]  &&  REST_API_ENDPOINT=localhost:8008

#run_creditcoin_client

#docker-compose -f /home/happymine/CreditCoin/Client/docker-compose.yaml up -d

while true
do
	timestamp
  	#TipBlkNum=$(docker exec -it creditcoin-client ./ccclient tip | awk '/^[0-9]/{print int($0)}')
	TipBlkNum=$(get_block_tip)
	echo -n "  $TipBlkNum "
	echo `curl -m 60 http://$REST_API_ENDPOINT/peers 2>/dev/null | grep tcp:// | cut -d \" -f2 | sed 's/^.*\///'`
	sleep 60
done
