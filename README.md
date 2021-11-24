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

## add information

```
# working dir
mkdir ~/work
cd ~/work

# git clone command
git clone --recursive https://github.com/luensys/CreditcoinDockerCompose-Mainnet.git

# first setup script
cd ~/work/CreditcoinDockerCompose-Mainnet/scripts/auto_setup.sh

```

### 스크립트 정보

- auto_setup.sh
  -- docker 설치 및 환경 세팅, 멀티테스킹 빌드까지
- add_crontab.sh
  -- crontab에 30분마다 재시작하는 코드 추가
