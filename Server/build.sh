sudo apt-get update
sudo apt-get install build-essential libboost-all-dev -y

sudo apt-get remove libcrypto++6 -y

git clone https://github.com/weidai11/cryptopp.git ~/cryptopp_sha

CURRENT_PATH=$(pwd)

cd ~/cryptopp_sha

make dynamic
sudo make install PREFIX=/usr/local
sudo ldconfig

cd $CURRENT_PATH

/usr/bin/g++-7 -O2 -Wall ./*.cpp -o ./hashServer -lboost_system -lpthread -lcryptopp
