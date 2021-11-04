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


#XFCE
apt install xorg lightdm liblightdm-gobject-1-0 lightdm-gtk-greeter lightdm-gtk-greeter-settings xfce4 xfwm4 firefox -y
apt-get install thunar-archive-plugin plymouth-theme-ubuntu-logo -y

#Podhodid dlya gnome i dlya xfce
apt-get install -y \
   ubiquity \
   ubiquity-casper \
   ubiquity-frontend-gtk \
   ubiquity-slideshow-ubuntu \
   ubiquity-ubuntu-artwork


    
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

#Splash image
cp 200.png /usr/share/plymouth/ubuntu-logo.png
cp 200.png /usr/share/plymouth/themes/spinner/watermark.png
cp 200.png /usr/share/plymouth/themes/ubuntu-logo/ubuntu-logo.png
cp 200.png /usr/share/plymouth/themes/ubuntu-logo/ubuntu-logo16.png
chmod 777 /usr/share/plymouth/ubuntu-logo.png
chmod 777 /usr/share/plymouth/themes/spinner/watermark.png
chmod 777 /usr/share/plymouth/themes/ubuntu-logo/ubuntu-logo.png
chmod 777 /usr/share/plymouth/themes/ubuntu-logo/ubuntu-logo16.png
update-initramfs -u

#Start icon
cp xfce4-panel-menu\(16\).png /usr/share/icons/hicolor/16x16/apps/xfce4-panel-menu.png
cp xfce4-panel-menu\(22\).png /usr/share/icons/hicolor/22x22/apps/xfce4-panel-menu.png
cp xfce4-panel-menu\(24\).png /usr/share/icons/hicolor/24x24/apps/xfce4-panel-menu.png
cp xfce4-panel-menu\(32\).png /usr/share/icons/hicolor/32x32/apps/xfce4-panel-menu.png
cp xfce4-panel-menu\(48\).png /usr/share/icons/hicolor/48x48/apps/xfce4-panel-menu.png
cp xfce4-panel-menu\(48\).png /usr/share/icons/elementary-xfce/apps/48/xfce4-panel-menu.png
chmod 777 /usr/share/icons/hicolor/16x16/apps/xfce4-panel-menu.png
chmod 777 /usr/share/icons/hicolor/22x22/apps/xfce4-panel-menu.png
chmod 777 /usr/share/icons/hicolor/24x24/apps/xfce4-panel-menu.png
chmod 777 /usr/share/icons/hicolor/32x32/apps/xfce4-panel-menu.png
chmod 777 /usr/share/icons/hicolor/48x48/apps/xfce4-panel-menu.png
chmod 777 /usr/share/icons/elementary-xfce/apps/48/xfce4-panel-menu.png

#Wallpaper
cp wallpaper.png /usr/share/backgrounds/xfce/xfce-stripes.png
cp wallpaper.jpg /usr/share/backgrounds/xfce/xfce-blue.jpg
cp wallpaper.jpg /usr/share/backgrounds/xfce/xfce-teal.jpg
chmod 777 /usr/share/backgrounds/xfce/xfce-stripes.png
chmod 777 /usr/share/backgrounds/xfce/xfce-blue.jpg
chmod 777 /usr/share/backgrounds/xfce/xfce-teal.jpg

#Themes
rm -rf /usr/share/themes/Greybird
rm -rf /usr/share/themes/Default
cp -ra theme /usr/share/themes/Greybird
cp -ra theme /usr/share/themes/Default
chmod 777 /usr/share/themes/Greybird
chmod 777 /usr/share/themes/Default


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
