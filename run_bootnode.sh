#!/bin/bash

# 탬플릿으로 부터 genesis.json 파일과 node 숫자 만큼의 key pair 생성
/opt/besu/bin/besu operator generate-blockchain-config --config-file=ibftConfigFile.json --to=besu-data --private-key-file-name=key
echo "genesis.json and keys were generated"

 생성된 key pair 를 각 node 폴더에 복사
key_folder_array=($(ls besu-data/keys))

echo "key folder array for bootnode : "
echo ${key_folder_array[0]}
cp besu-data/keys/${key_folder_array[0]}/* bootnode/keys/

echo "key folder array for node1 : "
echo ${key_folder_array[1]}
cp besu-data/keys/${key_folder_array[1]}/* node1/keys/

echo "key folder array for node2 : "
echo ${key_folder_array[2]}
cp besu-data/keys/${key_folder_array[2]}/* node2/keys/

echo "copy keys from besu-data to each node folder finished"

# 부트노드 besu 서비스 실행
/opt/besu/bin/besu --data-path=bootnode --genesis-file=besu-data/genesis.json --node-private-key-file=bootnode/keys/key \
    --network-id=2021 --miner-enabled --miner-coinbase=0x2A29e1c0a64a632b640f0a295066B395d13f4b4A \
    --p2p-host=0.0.0.0 --p2p-interface=0.0.0.0 --p2p-port=30303 --host-allowlist="*" \
    --rpc-http-enabled --rpc-http-api=ETH,NET,IBFT,WEB3,TRACE,DEBUG  --rpc-http-cors-origins="all" --rpc-http-port=8545 \
    --rpc-ws-enabled --rpc-ws-port=8546 \
    --revert-reason-enabled=true --min-gas-price=800000000000 --api-gas-price-max=5000000000000 &

echo "BESU Network was started on BootNode!!!"
echo "Pleas wait about 30 seconds for booting Besu Network."
sleep 30

# 부트노드의 enode 확인
echo $(curl -X POST --data '{"jsonrpc":"2.0","method":"net_enode","params":[],"id":2021}' http://127.0.0.1:8545 | jq -r '.result') > enode_bootnode
