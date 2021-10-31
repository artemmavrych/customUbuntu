#!/bin/bash
source configuration.txt

apt-get autoremove -y

dpkg-reconfigure resolvconf

cat <<EOF > /etc/NetworkManager/NetworkManager.conf
[main]
rc-manager=resolvconf
plugins=ifupdown,keyfile
dns=dnsmasq

[ifupdown]
managed=false
EOF

rm 03-chroot-settings.sh
rm 04-chroot-networkClearExit.sh
rm configuration.txt


dpkg-reconfigure network-manager

truncate -s 0 /etc/machine-id

rm /sbin/initctl

dpkg-divert --rename --remove /sbin/initctl

apt-get clean

rm -rf /tmp/* ~/.bash_history

umount /proc

umount /sys

umount /dev/pts

export HISTSIZE=0

exit
