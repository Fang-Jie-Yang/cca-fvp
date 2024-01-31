#! /bin/bash

## running FVP simulation using rootfs we made
ROOTFS="$PWD/build/rootfs.ext4"

export PATH=$PWD/build/shrinkwrap/shrinkwrap:$PATH
export SHRINKWRAP_BUILD=$PWD/build/shrinkwrap_build
export SHRINKWRAP_PACKAGE=$PWD/build/shrinkwrap_package

shrinkwrap run cca-3world.yaml --rtvar ROOTFS=${ROOTFS}
