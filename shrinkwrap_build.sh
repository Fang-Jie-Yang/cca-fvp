#! /bin/bash

export PATH=$PWD/build/shrinkwrap/shrinkwrap:$PATH
export SHRINKWRAP_BUILD=$PWD/build/shrinkwrap_build
export SHRINKWRAP_PACKAGE=$PWD/build/shrinkwrap_package
shrinkwrap build cca-3world.yaml --overlay buildroot.yaml --btvar GUEST_ROOTFS='${artifact:BUILDROOT}'
