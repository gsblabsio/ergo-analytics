#!/bin/bash

java -jar /home/ergo/ergo.jar --mainnet -c /home/ergo/ergo.conf &

sleep 10s

OUTPUT=$(curl -X POST "http://127.0.0.1:9053/utils/hash/blake2b" -H "accept: application/json" -H "Content-Type: application/json" -d "\"$API_KEY\"")
sed -i "s/HASH/$OUTPUT/g" /home/ergo/ergo.conf
sed -i "s/#apiKeyHash/apiKeyHash/g" /home/ergo/ergo.conf

kill -9 `ps -ef | grep java | grep jar | awk '{print $2}'`

java -jar /home/ergo/ergo.jar --mainnet -c /home/ergo/ergo.conf
