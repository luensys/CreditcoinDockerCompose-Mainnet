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

function get_peers {
  curl -m 60 http://$REST_API_ENDPOINT/peers 2>/dev/null | grep tcp:// | cut -d \" -f2 | sed 's/^.*\///' | paste -sd ","
  return $?
}

[ -z $REST_API_ENDPOINT ]  &&  REST_API_ENDPOINT=localhost:8008

#run_creditcoin_client
interval=60
follow=false
while getopts n:f flag
do
	case "${flag}" in
		n) interval=${OPTARG}
		;;
		f) follow=true
		;;
	esac
done


while :
do
	# timestamp
	Load=$(uptime)
 	TipBlkNum=$(get_block_tip)
	Peers=$(get_peers)
	echo " $Load $TipBlkNum $Peers"
	if [ "$follow" = false ]; then
	  break
	fi
	sleep $interval
done
