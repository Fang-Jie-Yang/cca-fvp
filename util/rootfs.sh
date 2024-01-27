#! /bin/bash

## make a (arm64) ubuntu 22.04 rootfs for VM, FVP simulation

RELEASE_URL="https://cloud-images.ubuntu.com/releases/jammy/release"
IMAGE="ubuntu-22.04-server-cloudimg-arm64-root.tar.xz"
ROOTFS="rootfs.ext4"
ROOT_PASSWD="root::0:0:root:/root:/bin/bash"

wget ${RELEASE_URL}/${IMAGE}
qemu-image create -f raw ${ROOTFS} 20G
mkfs.ext4 ${ROOTFS}
sudo mount ${ROOTFS} /mnt
sudo tar xvf ${IMAGE} -C /mnt
sync 
sudo touch /mnt/etc/cloud/cloud-init.disabled
sudo sed -i "1s/.*/${ROOT_PASSWD}" /mnt/etc/passwd
sudo umount /mnt
