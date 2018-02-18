#!/bin/bash

cd ../../arionum-java/arionum-miner

touch ../../arionum-miner.log

./run.sh | tee ../../arionum-miner.log
