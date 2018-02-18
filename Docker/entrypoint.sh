#!/bin/sh

# Create the config file...
touch /arionum-java/arionum-miner/config.cfg

if [ "$TYPE" -eq "pool" ];
  then
cat <<EOT >> /arionum-java/arionum-miner/config.cfg
$TYPE
$NODE
$WALLET
$HASHER_COUNT
$HASHER_MODE
$COLORS
$WORKER_NAME
EOT
  else
cat <<EOT >> /arionum-java/arionum-miner/config.cfg
$TYPE
$NODE
$PUBKEY
$PRIKEY
$HASHER_COUNT
$HASHER_MODE
$COLORS
$WORKER_NAME
EOT

# Run the miner...
cd /arionum-java/arionum-miner
# ulimit -c unlimited
java -jar arionum-miner-java.jar
