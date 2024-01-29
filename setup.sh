#! /bin/bash

mkdir build
./util/rootfs.sh
./util/kernel.sh
./util/docker.sh
./util/shrinkwrap.sh
