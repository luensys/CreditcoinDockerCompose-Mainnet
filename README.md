# Docker Compose files for Creditcoin Mainnet

Everything you need to get started connecting to the Creditcoin Mainnet environment

Please see the following pages for Creditcoin mainnet documentation:

- https://docs.creditcoin.org - Main documentation page
- https://docs.creditcoin.org/updating-creditcoin-nodes - Updating nodes and downloading blockchain snapshot

Requirement

- Ubuntu 18.04
- Docker 20.10+

You must run build.sh in the ./Server directory.

I'm using all the cores.
![Multithreading](https://user-images.githubusercontent.com/19469291/128811623-c0c66a92-8150-455a-b3a6-e6cd96adb0d3.png)

## script queue

```
# working dir
mkdir ~/work
cd ~/work

# git clone command
git clone --recursive https://github.com/luensys/CreditcoinDockerCompose-Mainnet.git

# first setup script (bashrc insert include)
cd ~/work/CreditcoinDockerCompose-Mainnet/scripts
./auto_setup.sh

# env copy
cd ~/work/CreditcoinDockerCompose-Mainnet
cp env_example .env
# and change .env file (ipaddr, port, etc)

# Server Start and Stop
cd ~/work/CreditcoinDockerCompose-Mainnet/scripts
./docker_start_and_stop.sh

# -optional- key into .env file
cd ~/work/CreditcoinDockerCompose-Mainnet/scripts
./get_key_to_env.sh

# miner configure setup
cd ~/work/CreditcoinDockerCompose-Mainnet/Server/scripts
./configure_creditcoin.sh
# after insert infura url

# gatewayConfig.json file change
cd ~/work/CreditcoinDockerCompose-Mainnet/scripts
./gateway_change.sh

# docker-compose ip and port change
cd ~/work/CreditcoinDockerCompose-Mainnet/scripts
./docker-compose_change.sh

# -optional- key change
cd ~/work/CreditcoinDockerCompose-Mainnet/scripts
./key_change.sh

# clientConfig.json file change
cd ~/work/CreditcoinDockerCompose-Mainnet/scripts
./client_change.sh

# snapshot change
cd ~/work/CreditcoinDockerCompose-Mainnet/scripts
./snapshot.sh

```

### 스크립트 정보

- auto_setup.sh
  -- docker 설치 및 환경 세팅, 멀티테스킹 빌드까지
- add_crontab.sh
  -- crontab에 30분마다 재시작하는 코드 추가

### 환경 변수
