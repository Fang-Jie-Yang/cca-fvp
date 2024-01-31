

### to remove snap in rootfs
* (in guest)
* `sudo apt autoremove --purge snapd`
* `sudo apt-mark hold snapd`
* `sudo systemctl disable snapd`

### remove systemd-networkd-wait-online.service to boot faster
* (in guest)
* `systemctl disable systemd-networkd-wait-online`

### network in VM
* `ip link set enp0s1 up; dhclient`
