#!/bin/bash

# install java
brew update
brew install openjdk@17

# download besu binary
wget https://hyperledger.jfrog.io/artifactory/besu-binaries/besu/22.7.2/besu-22.7.2.tar.gz -P /tmp
sudo tar -xzf /tmp/besu-22.7.2.tar.gz -C /opt/
sudo mv /opt/besu-* /opt/besu
# sudo chown -R medium:medium /opt/besu # 안해줘도 besu 바이너리 읽을 수 있어서 생략했음. 

mkdir besu-data
mkdir -p bootnode/keys
mkdir -p node1/keys
mkdir -p node2/keys

