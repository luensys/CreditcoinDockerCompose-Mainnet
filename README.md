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

## First install and start

```
# working dir
mkdir ~/work
cd ~/work

# git clone command
git clone --recursive https://github.com/luensys/CreditcoinDockerCompose-Mainnet.git

# Step 0. Docker install and bashrc setup (only once)
cd ~/work/CreditcoinDockerCompose-Mainnet/scripts
./0-docker-install.sh
./0.1-bashrc.sh
# Step 0.last Environment Copy
cp ~/work/CreditcoinDockerCompose-Mainnet/env_example ~/.env
# and change .env file (ipaddr, port, etc)
# miner configure setup
cd ~/work/CreditcoinDockerCompose-Mainnet/Server/scripts
./configure_creditcoin.sh
# after insert infura url

# Step 1. Server Start and Stop For First Excute
cd ~/work/CreditcoinDockerCompose-Mainnet/scripts
./1-docker-start-and-stop.sh

# Step 2. Multitasking build
cd ~/work/CreditcoinDockerCompose-Mainnet/scripts
./2-multitask-build.sh

# -optional- key into .env file
cd ~/work/CreditcoinDockerCompose-Mainnet/scripts
./get_key_to_env.sh

# Step 3. miner configure setup
cd ~/work/CreditcoinDockerCompose-Mainnet/Server/scripts
./configure_creditcoin.sh
# after insert infura url

# Step 4. docker-compose ip and port change
cd ~/work/CreditcoinDockerCompose-Mainnet/scripts
./4-docker-compose-change.sh
# and if you need, change more docker-compose.yaml

# -optional- key change
cd ~/work/CreditcoinDockerCompose-Mainnet/scripts
./key_change.sh

# Step 5. clientConfig.json file change
cd ~/work/CreditcoinDockerCompose-Mainnet/scripts
./5-client-change.sh

# Step 6. snapshot change
cd ~/work/CreditcoinDockerCompose-Mainnet/scripts
./6-snapshot.sh

# Step 7. start file change
cd ~/work/CreditcoinDockerCompose-Mainnet/scripts
./7-start-file-change.sh

```

## Update sourcecode

```
# Step 1. script and Directory backup after Docker finish
cd ~/work/CreditcoinDockerCompose-Mainnet/scripts
./backup.sh

# Step 2. git clone again
cd ~/work
# git clone command
git clone --recursive https://github.com/luensys/CreditcoinDockerCompose-Mainnet.git

# -optional- Multitasking build
cd ~/work/CreditcoinDockerCompose-Mainnet/scripts
./2-multitask-build.sh

# Step 3. docker-compose ip and port change
cd ~/work/CreditcoinDockerCompose-Mainnet/scripts
./4-docker-compose-change.sh
# and if you need, change more docker-compose.yaml

# -optional- key change
cd ~/work/CreditcoinDockerCompose-Mainnet/scripts
./key_change.sh

# Step 4. clientConfig.json file change
cd ~/work/CreditcoinDockerCompose-Mainnet/scripts
./5-client-change.sh

```

### script information

- auto_setup.sh
  -- docker 설치 및 환경 세팅, 멀티테스킹 빌드까지
- add_crontab.sh
  -- crontab에 30분마다 재시작하는 코드 추가

### 환경 변수
