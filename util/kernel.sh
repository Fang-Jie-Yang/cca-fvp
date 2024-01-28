#! /bin/bash

## compile a (arm64) linux kernel for VM, FVP simulation

if [[ ! -e "linux" ]]; then
	git clone --depth=1 --branch=v6.7 https://github.com/torvalds/linux.git
fi

cd linux
yes | make ARCH=arm64 defconfig
yes | make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8

