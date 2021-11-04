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
rm -rf 200.png
rm -rf wallpaper.png
rm -rf wallpaper.jpg
rm -rf xfce4-panel-menu(16).png
rm -rf xfce4-panel-menu(22).png
rm -rf xfce4-panel-menu(24).png
rm -rf xfce4-panel-menu(32).png
rm -rf xfce4-panel-menu(48).png
rm -rf theme

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
echo "Type exit after installing all necessary tools (We still need to install Windows Manager(sddm, lightdm or gdm) and installer (calamares or  ubiquity) ."
exit
