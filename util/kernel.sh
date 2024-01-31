#! /bin/bash

## compile a (arm64) linux kernel for VM, FVP simulation

cd $PWD/build

yes | sudo apt update
yes | sudo apt install bc
yes | sudo apt install build-essential flex bison
yes | sudo apt install gcc gcc-aarch64-linux-gnu binutils-aarch64-linux-gnu
yes | sudo apt install libssl-dev

if [[ ! -e "linux" ]]; then
	git clone --depth=1 --branch=v6.7 https://github.com/torvalds/linux.git
fi

cd linux
yes | make ARCH=arm64 defconfig
yes | make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8

