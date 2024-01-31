

### to remove snap in rootfs
* (in guest)
* `sudo apt autoremove --purge snapd`
* `sudo apt-mark hold snapd`
* `sudo systemctl disable snapd`

### remove `systemd-networkd-wait-online.service` to boot faster
* (in guest)
* `systemctl disable systemd-networkd-wait-online`

### network in VM
* `ip link set enp0s1 up; dhclient`

### to boot Realm VM in FVP
* `./lkvm run --realm --disable-sve --irqchip=gicv3-its --firmware KVMTOOL_EFI.fd -c 1 -m 512 --no-pvtime --force-pci --disk guest-disk.img --measurement-algo=sha256`
