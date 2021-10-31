#!/bin/bash
source configuration.txt

sudo debootstrap \
   --arch=amd64 \
   --variant=minbase \
   focal \
   $HOME/$WORKSPACE/chroot \
   http://ua.archive.ubuntu.com/ubuntu/

sudo cp ./03-chroot-settings.sh $HOME/$WORKSPACE/chroot
sudo cp ./04-chroot-networkClearExit.sh $HOME/$WORKSPACE/chroot
sudo cp ./configuration.txt $HOME/$WORKSPACE/chroot
sudo mount --bind /dev $HOME/$WORKSPACE/chroot/dev
sudo mount --bind /run $HOME/$WORKSPACE/chroot/run
sudo chroot $HOME/$WORKSPACE/chroot
