sudo apt-get update
sudo apt-get install build-essential libboost-all-dev libcrypto++-dev -y

/usr/bin/g++-7 -g ./*.cpp -o ./hashServer -lboost_system -lpthread -lcryptopp