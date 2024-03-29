#! /bin/bash

## make a new (arm64) ubuntu 22.04 rootfs for VM, FVP simulation

yes | sudo apt update
yes | sudo apt install qemu-system qemu-utils

RELEASE_URL="https://cloud-images.ubuntu.com/releases/jammy/release"
IMAGE="ubuntu-22.04-server-cloudimg-arm64-root.tar.xz"
ROOTFS="rootfs.ext4"
ROOT_PASSWD="root::0:0:root:/root:/bin/bash"

cd $PWD/build

if [[ ! -e ${IMAGE} ]]; then
	wget ${RELEASE_URL}/${IMAGE}
fi

if [[ -e ${ROOTFS} ]]; then
	rm ${ROOTFS}
fi
qemu-img create -f raw ${ROOTFS} 10G
mkfs.ext4 ${ROOTFS}

if sudo mount ${ROOTFS} /mnt; then
	sudo tar xvf ${IMAGE} -C /mnt
	sync 
	sudo touch /mnt/etc/cloud/cloud-init.disabled
	sudo sed -i "1s@.*@${ROOT_PASSWD}@" /mnt/etc/passwd
	sudo umount /mnt
else
	echo "Failed to mount ${ROOTFS}, exiting"
fi
