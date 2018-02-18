#!/bin/bash

apt-get update

apt-get -y install maven git build-essential

apt-get -y -o Dpkg::Options::="--force-overwrite" install openjdk-9-jdk

export JAVA_HOME=/usr

cd ../..

git clone git://github.com/ProgrammerDan/arionum-java

cd arionum-java/arionum-miner \
  && mvn -e clean package \
  && chmod +x build-argon.sh \
  && ./build-argon.sh

chown -R $(logname): ../../arionum-java
