#! /bin/bash

git clone --depth=1 --branch=migration git@github.com:ntu-ssl/linux-cca.git
git clone --recurse-submodules git@github.com:ntu-ssl/cca-rmm.git
cat << EOF > ntussl-overlay.yaml
build:
  linux:
    sourcedir: ${PWD}/linux-cca
  rmm:
    sourcedir: ${PWD}/cca-rmm
EOF

mkdir build
util/rootfs.sh
util/kernel.sh
util/docker.sh
util/shrinkwrap.sh

# start docker manually
sudo service docker start

# run shrinkwrap as docker group
sg docker -c "./shrinkwrap_build.sh"

# setup images, binary for Realm guest
ROOTFS="$PWD/build/rootfs.ext4"
cd build/shrinkwrap_package/cca-3world
sudo su -c "mkdir mnt"
sudo su -c "mount ${ROOTFS} mnt"
sudo su -c "mkdir mnt/cca"
sudo su -c "cp rootfs.ext2 guest-disk.img KVMTOOL_EFI.fd lkvm mnt/cca/."
sudo su -c "umount mnt"
sudo su -c "rm -rf mnt"
