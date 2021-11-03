#!/bin/bash
source configuration.txt

mount none -t proc /proc
mount none -t sysfs /sys
mount none -t devpts /dev/pts
export HOME=/root
export LC_ALL=C
echo $DISTRO_HOSTNAME > /etc/hostname 

cat <<EOF > /etc/apt/sources.list
deb http://ua.archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse
deb-src http://ua.archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse
deb http://ua.archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse
deb-src http://ua.archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse
deb http://ua.archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse
deb-src http://ua.archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse
EOF

apt-get update && \
apt-get install -y libterm-readline-gnu-perl systemd-sysv


dbus-uuidgen > /etc/machine-id
ln -fs /etc/machine-id /var/lib/dbus/machine-id
dpkg-divert --local --rename --add /sbin/initctl
ln -s /bin/true /sbin/initctl

apt-get -y upgrade && \
apt-get install -y \
    sudo \
    ubuntu-standard \
    casper \
    lupin-casper \
    discover \
    laptop-detect \
    os-prober \
    network-manager \
    resolvconf \
    net-tools \
    wireless-tools \
    wpagui \
    locales \
    grub-common \
    grub-gfxpayload-lists \
    grub-pc \
    grub-pc-bin \
    grub2-common \
    nano \
    screenfetch \
    wget \
    vim \
    less \
    git \
    iputils-ping \
    memtest86+
    
    
    #lxqt sddm openbox btrfs-progs cracklib-runtime dmeventd dmraid jfsutils klibc-utils \
    #kpartx kpartx-boot libaio1 libboost-python1.71.0 libcrack2 libdevmapper-event1.02.1 libdmraid1.0.0.rc16 libklibc liblvm2cmd2.03 libpwquality-common libpwquality1 \
    #libreadline5 memtest86+ libyaml-cpp0.6 lvm2 mokutil reiserfsprogs thin-provisioning-tools wamerican xfsprogs  \
    #zram-config lz4 busybox-initramfs cifs-utils cryptsetup cryptsetup-bin cryptsetup-initramfs cryptsetup-run initramfs-tools \
    #initramfs-tools-bin initramfs-tools-core language-pack-en language-pack-en-base libefivar1 linux-base
    
    apt-get install -y --no-install-recommends linux-generic 
#    lightdm xfce4* && \
apt-get clean
#apt install xfce4-goodies -y

#apt-get install -y --no-install-recommends \
#    xserver-xorg-core xserver-xorg xinit xterm \
#    screen lxterminal \
#    psmisc nmap less  git ca-certificates  && \
#apt install kde-plasma-desktop -y
#apt install kde-standard -y
#apt-get remove --auto-remove language-selector-gnome gnome-user-docs gnome-settings-daemon-common gnome-settings-daemon gnome-online-accounts gdm3 gnome-session-wayland ubuntu-gnome-desktop gnome-control-center-data gnome-control-center-faces gnome-desktop3-data gnome-keyring gnome-keyring-pkcs11:amd64 -y
#apt-get purge --auto-remove language-selector-gnome gnome-user-docs gnome-settings-daemon-common gnome-settings-daemon gnome-online-accounts gdm3 gnome-session-wayland ubuntu-gnome-desktop gnome-control-center-data gnome-control-center-faces gnome-desktop3-data gnome-keyring gnome-keyring-pkcs11:amd64 -y
#apt-get autoremove -y

# kde-full(kde-plasma-desktop or kde-standard)  i blackbox instead of openbox lxqt and lxqt-core sddm
#apt install tasksel
#tasksel install kubuntu-full 
# ili 
# sudo tasksel install kubuntu-desktop
# 
apt install apparmor-utils apparmor-profiles -y
apt install cups -y
#Esli stanet kde-standard bez gnome i budet prosmotshik to udalit gwenview
apt install print-manager gwenview -y
#Okular - pdf reader
apt install libreoffice-base okular libreoffice-calc libreoffice-draw libreoffice-impress libreoffice-math libreoffice-writer -y
apt-get install plymouth-theme-ubuntu-logo -y

#Ubiquity 
apt-get install -y \
   ubiquity \
   ubiquity-casper \
   ubiquity-frontend-gtk \
   ubiquity-slideshow-ubuntu \
   ubiquity-ubuntu-artwork

apt-get install -y \
plymouth-theme-ubuntu-logo \
ubuntu-gnome-desktop \
ubuntu-gnome-wallpapers



#cat <<EOF > /etc/sddm.conf
#[General]
#InputMethod=
#EOF

#useradd -m sbu -s /bin/bash

#echo 'sbu:sbu' | chpasswd

#cat <<EOF > /etc/sddm.conf
#[Users]
#MinimumUid=999
#
#[Autologin]
#user=sbu
#Session=lxqt.desktop
#EOF


dpkg-reconfigure locales


# Mojet rabotat ne pravilno !! RAZBERIS V SDDM!!!

printf "Change root password:\n"
passwd root

echo "Ustanovit vse 4to nado tut, ne zabit installer i posovetovatsya s Sashey."
