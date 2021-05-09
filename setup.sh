## bin/bash
cd
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install build-essential cmake automake libtool autoconf -y
mkdir build
cd scripts
./build_deps.sh
cd ../build
cmake .. -DXMRIG_DEPS=scripts/deps
make -j$(nproc)
cd ../
sudo mv xmrig.service /etc/systemd/system/xmrig.service
sudo systemctl enable --now xmrig
