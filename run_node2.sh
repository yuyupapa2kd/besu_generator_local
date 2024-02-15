#!/bin/bash

/opt/besu/bin/besu --data-path=node2 --genesis-file=besu-data/genesis.json --node-private-key-file=node2/keys/key \
    --network-id=2021 --miner-enabled --miner-coinbase=0x2A29e1c0a64a632b640f0a295066B395d13f4b4A \
    --p2p-host=0.0.0.0 --p2p-interface=0.0.0.0 --p2p-port=30305 --host-allowlist="*" \
    --rpc-http-enabled --rpc-http-api=ETH,NET,IBFT,WEB3,TRACE,DEBUG  --rpc-http-cors-origins="all" --rpc-http-port=8549 \
    --rpc-ws-enabled --rpc-ws-port=8550 \
    --revert-reason-enabled=true --min-gas-price=800000000000 --api-gas-price-max=5000000000000 \
    --bootnodes=enode://99a0d2ae12d96e8729a86aa2a5a6704dcdc65ed05ba1dcd59a1271b82fe3371489ca2c7154f19a527dcae5b6d27d5dd2816aef905f7b574bb013ad9d393d5b79@127.0.0.1:30303 &
