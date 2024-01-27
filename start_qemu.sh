#! /bin/bash

ROOTFS="rootfs.ext4"
## booting a arm64 vm using rootfs previously made

# TODO: if on arm64 platform, we should try to use kvm
# TODO: 
qemu-system-aarch64 -nographic -machine virt,gic-version=max -m 1024M -cpu max -smp 4 \
-netdev user,id=vnet -device virtio-net-pci,netdev=vnet \
-hda ${ROOTFS}


