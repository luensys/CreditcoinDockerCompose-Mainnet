#!/bin/bash
# creditcoin command selection

until [ "$opt" = "0" ] 
do
	CurBlkNum=0
	PreBlkNum=0
	CurPeerNum=0
	CurSrvBlkNum=0

	echo "========================================================================="
	echo "1. Start Sever&Client containers" 
	echo "2. Check docker containers' status"
	echo "3. Monitor block height every 10 minute (press Ctrl+C to quit)" 
	echo "4. Monitor the block height (Restart if same height with an hour ago)"
	echo "5. Check mining history on my server's perspective (press Ctrl+C to quit)" 
	echo "6. Print validator's debug messages (press Ctrl+C to quit)"
	echo "7. Monitor my server's peer status (press Ctrl+C to quit)"
	echo "8. Terminate Server&Client container" 
	echo "9. Print Private Key/Public Key/Sighash"
	echo "0. Quit this script"
	echo "-------------------------------------------------------------------------"
	printf "Enter the number and press Enter : "

	read opt

	echo "========================================================================="

	case $opt in 
		1)
			echo "Starting Server&Client docker containers..."
			docker-compose -f ./Server/creditcoin-with-gateway.yaml up -d
			sleep 1
			docker-compose -f ./Client/creditcoin-client.yaml up -d
			sleep 1
			;;
		2)
			echo "docker container's status are as following..."
			docker container ls 
			;;
		3)
			echo "Monitoring Block height every 10 minute..."
			while true 
                        do
                                CurBlkNum=$(docker exec -it creditcoin-client ./ccclient tip | awk '/^[0-9]/{print int($0)}')
                                CurPeerNum=$(curl http://localhost:8008/peers 2>/dev/null | grep tcp | wc -l)
                                CurSrvBlkNum=$(curl https://api.creditcoinexplorer.com/api/blockchain 2>/dev/null | grep 'blockHeight' | awk -F[:,] '{gsub("\"", ""); print $2}')
                                echo "$(date "+%Y-%m-%d %H:%M:%S") | [Server] $CurBlkNum [Network] $CurSrvBlkNum [Peer] $CurPeerNum"
                                sleep 600
                        done
                        ;;

		4)
			while true
			do
				CurBlkNum=$(docker exec -it creditcoin-client ./ccclient tip | awk '/^[0-9]/{print int($0)}')

				if [ "$PreBlkNum" -eq 0 ]
				then 
					echo "$(date "+%Y-%m-%d %H:%M:%S") | The Block height is $CurBlkNum."
				elif [ "$PreBlkNum" -eq "$CurBlkNum" ]
				then
					echo "$(date "+%Y-%m-%d %H:%M:%S") | Restarting Server&Client containers as current block height is same with that of one hour ago..."
					docker-compose -f ./Client/creditcoin-client.yaml down 			
					sleep 1
					docker-compose -f ./Server/creditcoin-with-gateway.yaml down
					sleep 1
					docker-compose -f ./Server/creditcoin-with-gateway.yaml up -d
					sleep 1
					docker-compose -f ./Client/creditcoin-client.yaml up -d
					sleep 1
				else 
					echo "$(date "+%Y-%m-%d %H:%M:%S") | The block height of one hour ago is $PreBlkNum, now is $CurBlkNum."
				fi

				PreBlkNum=$CurBlkNum
				sleep 3600
			done
			;;
		5)
			echo "Mining history of this server's perspective is as following..."
			echo "Please note that mining history of ledger's perspective would be different with this."
			pub=$(docker exec -it sawtooth-validator-default sh -c "cat /etc/sawtooth/keys/validator.pub")
			docker exec -it sawtooth-validator-default bash -c "sawtooth block list --url http://rest-api:8008 -F csv" | grep $pub | awk -F, 'BEGIN{printf("BLKNUM	SIGNER\n")} {printf("%s\t%s\n", $1, $5)}'
			;;
		6)
            echo "If no debug message printed, please check 'sawtooth-validator -vv' in 'Server/docker-compose.yaml', instead of 'sawtooth-validator'."
            valog=$(docker inspect --format='{{.LogPath}}' sawtooth-validator-default)
            sudo tail -f ${valog}
            ;;

		7) 
			echo "Checking peers list&status every 1 minute..."
			while true
			do
				timestamp() {
				  ts=`date +"%Y-%m-%d %H:%M:%S"`
				  echo -n $ts
				}
				REST_API_ENDPOINT=localhost:8008
				peers=`curl http://$REST_API_ENDPOINT/peers 2>/dev/null | grep tcp:// | cut -d \" -f2 | sed 's/^.*\///'`
				# For dynamic peering, need to log  nc  probe results to view history of connected peers over time.
				for p in $peers; do
				  ipv4_address=`echo $p | cut -d: -f1`
				  port=`echo $p | cut -d: -f2`
				  timestamp
				  preamble=" Peer $ipv4_address:$port is"
				  if nc -z $ipv4_address $port
				  then
				    echo "$preamble open"
				  else
				    echo "$preamble closed"
				  fi
				done
			sleep 60
			done | tee -a ctcpeer.result
			;;
		8)
			echo "Terminating Server&Client docker containers..."
			docker-compose -f ./Client/creditcoin-client.yaml down 			
			sleep 1
			docker-compose -f ./Server/creditcoin-with-gateway.yaml down
			sleep 1
			;;
		9)
            echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!WARNING!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" 
            echo "!YOU NEED TO TAKE EXTREME CAUTION TO SHARE THESE KEY WITH OTHERS, !"
            echo "!BECAUSE YOUR ASSETS WILL BE STOLEN, ONCE YOUR PRIVATE KEY LEAKED.!"
            echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!WARNING!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" 
	    echo "###       Private Key     ###"
            docker exec sawtooth-validator-default cat /etc/sawtooth/keys/validator.priv | grep "[0-9]"
            echo "###       Public Key      ###"
            docker exec sawtooth-validator-default cat /etc/sawtooth/keys/validator.pub | grep "[0-9]"
            echo "###       SigHash         ###"
            docker exec creditcoin-client ./ccclient sighash | grep "[0-9]"
            ;;

		0)
			break
			;;
		*)
			echo "Not Available option."
			;;
	esac
	echo ""
done
