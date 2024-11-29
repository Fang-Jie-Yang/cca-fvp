#! /bin/bash

ROOTFS="build/rootfs.ext4"
KERNEL="linux-cca/arch/arm64/boot/Image"
## booting a arm64 vm using rootfs previously made
CMDLINE="nokaslr kvm-arm.mode=nvhe arm64_sw.hvhe=1"

sudo \
qemu-system-aarch64 \
${KVM} \
$@ \
-machine virt,gic-version=3,virtualization=on -m 4G -cpu max -smp 1 \
-kernel ${KERNEL} \
-netdev user,id=vnet \
-device virtio-net-pci,netdev=vnet \
-drive if=none,file=${ROOTFS},id=vda,cache=none,format=raw \
-device virtio-blk-pci,drive=vda \
-nographic -serial mon:stdio \
-append "console=ttyAMA0 root=/dev/vda rw earlycon=pl011,0x09000000 ${CMDLINE}" \
-monitor none
