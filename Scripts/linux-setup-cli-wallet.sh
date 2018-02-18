#!/bin/bash

# Functions
add_ppa(){
  grep -h "ondrej/php" /etc/apt/sources.list.d/* > /dev/null
  if [ $? -ne 0 ]
  then
    echo "Adding Ondrej's PHP PPA."
    yes "" | add-apt-repository ppa:ondrej/php
  else
    echo "Ondrej's PHP PPA already exists!"
  fi
}

# Entrypoint...
cd ../..

# Add PHP PPA
add_ppa && apt-get update

apt-get -y install git php7.2

git clone https://github.com/arionum/lightWalletCLI.git

chown -R $(logname): lightWalletCLI
