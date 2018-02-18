#!/bin/bash

TYPE=""
WALLET=""
PUBKEY=""
PRIKEY=""
HASHER_COUNT=$(nproc)
COLORS="true"
WORKER_NAME=""

echo "Select the type of miner you would like to run. Type \"pool\" or \"solo\":"
read TYPE
echo

echo "Type the URL of the node you would like to connect to. Leave blank for \"http://aropool.com\":"
read NODE
if [ -z "$NODE" ];
  then
    NODE="http://aropool.com"
  else
    continue
fi
echo

if [ "$TYPE" -eq "pool" ];
  then
    echo "Please enter your wallet address:"
    read WALLET
    echo
  else
    echo "Please enter your public key:"
    read PUBKEY
    echo
    echo "Please enter your private key:"
    read PRIKEY
    echo
fi

echo "Please enter how many hashers you would like to run as an integer."
echo "Leave blank for the maximum your system can handle which is: $HASHER_COUNT"
read HASHER_COUNT
if [ -z "$HASHER_COUNT" ];
  then
    HASHER_COUNT=$(nproc)
fi
echo

# echo "Please choose a hasher mode - \"standard\", \"legacy\" or \"gpu\". Leave blank for standard:"
# read HASHER_MODE
# echo

echo "Enter a name for your worker (no spaces!):"
read WORKER_NAME
echo

if [ "$TYPE" == "pool" ];
  then
    docker run \
      -e TYPE=$TYPE \
      -e NODE=$NODE \
      -e WALLET=$WALLET \
      -e HASHER_COUNT=$HASHER_COUNT \
      -e COLORS=$COLORS \
      -e WORKER_NAME="$WORKER_NAME" \
      -it arionum-miner
  else
    docker run \
      -e TYPE=$TYPE \
      -e NODE=$NODE \
      -e PUBKEY=$PUBKEY \
      -e PRIKEY=$PRIKEY \
      -e HASHER_COUNT=$HASHER_COUNT \
      -e COLORS=$COLORS \
      -e WORKER_NAME="$WORKER_NAME" \
      -it arionum-miner
fi
