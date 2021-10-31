#!/bin/bash
WORKPATH=$(pwd)
sudo apt install \
    binutils \
    debootstrap \
    squashfs-tools \
    xorriso \
    grub-pc-bin \
    grub-efi-amd64-bin \
    mtools \
    screenfetch \
    net-tools \


WORKSPACE=$(whiptail --inputbox "Enter workspace directory name:" 8 39 DirectoryName --title "Example Dialog" 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "User selected Ok and entered " $WORKSPACE
    echo "WORKSPACE=$WORKSPACE" >> $WORKPATH/configuration.txt
else
    echo "User selected Cancel."
fi
echo "(Exit status was $exitstatus)"



NAME=$(whiptail --inputbox "Enter distro name:" 8 39 Name --title "Example Dialog" 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "User selected Ok and entered " $NAME
    echo "NAME=$NAME" >> $WORKPATH/configuration.txt
else
    echo "User selected Cancel."
fi
echo "(Exit status was $exitstatus)"


DISTRO_HOSTNAME=$(whiptail --inputbox "Enter distro hostname:" 8 39 Hostname --title "Example Dialog" 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "User selected Ok and entered " $DISTRO_HOSTNAME
    echo "DISTRO_HOSTNAME=$DISTRO_HOSTNAME" >> $WORKPATH/configuration.txt
else
    echo "User selected Cancel."
fi
echo "(Exit status was $exitstatus)"



VERSION=$(whiptail --inputbox "Enter version:" 8 39 version --title "Example Dialog" 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "User selected Ok and entered " $VERSION
    echo "VERSION=$VERSION" >> $WORKPATH/configuration.txt
else
    echo "User selected Cancel."
fi
echo "(Exit status was $exitstatus)"

chmod 755 $WORKPATH/configuration.txt
