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

apt-get update

apt-get install -y libterm-readline-gnu-perl systemd-sysv


dbus-uuidgen > /etc/machine-id
ln -fs /etc/machine-id /var/lib/dbus/machine-id
dpkg-divert --local --rename --add /sbin/initctl
ln -s /bin/true /sbin/initctl

apt-get -y upgrade

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


apt-get install -y --no-install-recommends linux-generic


#LXQT Testing
#apt-get install -y \
#   xorg \
#   lxqt \
#   sddm 
#apt --no-install-recommends install kwin-x11 kwin-style-breeze kwin-addons systemsettings -y


#XFCE
apt install xorg lightdm liblightdm-gobject-1-0 lightdm-gtk-greeter lightdm-gtk-greeter-settings xfce4 xfwm4 -y

#Podhodid dlya gnome i dlya xfce
apt-get install -y \
   ubiquity \
   ubiquity-casper \
   ubiquity-frontend-gtk \
   ubiquity-slideshow-ubuntu \
   ubiquity-ubuntu-artwork


#Gnome OK
#apt-get install -y \
#    gnome-session-flashback gnome-shell gnome-themes-standard \
#    gnome-terminal gnome-control-center nautilus \
#    gnome-icon-theme gdm3 plymouth-theme-ubuntu-logo gjs gnome-backgrounds gnome-applets
#    
# gnome-session ubral dlya testa   
#gnome-session-flashback интересный
#gnome-core доп инструменты гнома (календари , калькуляторы)

    
apt-get purge -y \
    transmission-gtk \
    transmission-common \
    gnome-mahjongg \
    gnome-mines \
    gnome-sudoku \
    aisleriot \
    hitori
apt-get remove --purge gnome*
apt-get autoremove -y


dpkg-reconfigure locales

apt-get clean

#apt install apparmor-utils apparmor-profiles -y
#apt install cups -y
#apt install system-config-printer-gnome -y
#apt install libreoffice-base libreoffice-calc libreoffice-draw libreoffice-impress libreoffice-math libreoffice-writer -y

#Untested
#apt-get remove --purge gnome*

#Remove gnome
apt remove nautilus gnome-power-manager gnome-screensaver gnome-termina* gnome-pane* gnome-applet* gnome-bluetooth gnome-desktop* gnome-sessio* gnome-user* gnome-shell-common compiz compiz* unity unity* hud zeitgeist zeitgeist* libzeitgeist* activity-log-manager-common gnome-control-center gnome-screenshot overlay-scrollba* && sudo apt-get install xubuntu-community-wallpapers && sudo apt-get autoremove

printf "Change root password:\n"
passwd root

echo "Ustanovit vse 4to nado tut, ne zabit installer i posovetovatsya s Sashey."
