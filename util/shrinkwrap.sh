#! /bin/bash

cd $PWD/build

yes | sudo apt update
yes | sudo apt install git netcat-openbsd python3 python3-pip telnet
sudo pip3 install pyyaml termcolor tuxmake
sudo pip3 install graphlib-backport
git clone https://git.gitlab.arm.com/tooling/shrinkwrap.git
