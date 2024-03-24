#! /bin/bash

mkdir build
util/rootfs.sh
util/kernel.sh
util/docker.sh
util/shrinkwrap.sh

# start docker manually
sudo service docker start

# run shrinkwrap as docker group
sg docker -c "./shrinkwrap_build.sh"

ROOTFS="$PWD/build/rootfs.ext4"
SHRINKWRAP_PACKAGE=$PWD/build/shrinkwrap_package
cd ${SHRINKWRAP_PACKAGE}/cca-3world
e2fsck -fp rootfs.ext2
resize2fs rootfs.ext2 32G
sudo su -c "mkdir mnt"
sudo su -c "mount ${ROOTFS} mnt"
sudo su -c "mkdir mnt/cca"
sudo su -c "cp guest-disk.img KVMTOOL_EFI.fd lkvm mnt/cca/."
sudo su -c "umount mnt"
sudo su -c "rm -rf mnt"

sudo reboot
