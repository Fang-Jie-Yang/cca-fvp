
## Scripts for running CCA on FVP
* `setup.sh`: setup environment (shrinkwarp, QEMU, rootfs, linux kernel)
* `start_fvp.sh`: boot linux-cca with `build/rootfs.ext4` as root with FVP
* `start_qemu.sh`: boot linux with `build/rootfs.ext4` as root with FVP
* `build/rootfs.ext4`: standard ubuntu cloud image

## Some tips for booting faster
* remove snap in rootfs
  * (in QEMU guest)
  * `sudo apt autoremove --purge snapd`
  * `sudo apt-mark hold snapd`
  * `sudo systemctl disable snapd`
* remove `systemd-networkd-wait-online.service`
  * (in QEMU guest)
  * `systemctl disable systemd-networkd-wait-online`
## To enable network in VM
* `ip link set enp0s1 up; dhclient`
## To boot Realm VM in FVP guest
* `./lkvm run --realm --disable-sve --irqchip=gicv3-its --firmware KVMTOOL_EFI.fd -c 1 -m 512 --no-pvtime --force-pci --disk guest-disk.img --measurement-algo=sha256`
