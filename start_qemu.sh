#! /bin/bash

ROOTFS="build/rootfs.ext4"
KERNEL="build/linux/arch/arm64/boot/Image"
## booting a arm64 vm using rootfs previously made

# TODO: maybe we can just use chroot
ARCH=$(uname -m)
if [[ ${ARCH} =~ "aarch64" ]]; then
	sudo usermod -aG kvm ${USER}
	newgrp kvm
	KVM="--enable-kvm"
fi

qemu-system-aarch64 \
${KVM} \
-machine virt,gic-version=max -m 1024M -cpu max -smp 4 \
-kernel ${KERNEL} \
-netdev user,id=vnet \
-device virtio-net-pci,netdev=vnet \
-drive if=none,file=${ROOTFS},id=vda,cache=none,format=raw \
-device virtio-blk-pci,drive=vda \
-nographic -serial stdio \
-append "console=ttyAMA0 root=/dev/vda rw earlycon=pl011,0x09000000" \
-monitor none 


