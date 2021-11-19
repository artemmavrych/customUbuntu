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
sudo cp ./200.png $HOME/$WORKSPACE/chroot
sudo cp ./wallpaper.png $HOME/$WORKSPACE/chroot
sudo cp ./wallpaper.jpg $HOME/$WORKSPACE/chroot
sudo cp ./xfce4-panel-menu\(16\).png $HOME/$WORKSPACE/chroot
sudo cp ./xfce4-panel-menu\(22\).png $HOME/$WORKSPACE/chroot
sudo cp ./xfce4-panel-menu\(24\).png $HOME/$WORKSPACE/chroot
sudo cp ./xfce4-panel-menu\(32\).png $HOME/$WORKSPACE/chroot
sudo cp ./xfce4-panel-menu\(48\).png $HOME/$WORKSPACE/chroot
sudo cp -r ./theme $HOME/$WORKSPACE/chroot/
sudo cp -r ./icons $HOME/$WORKSPACE/chroot/
sudo cp -r ./.config $HOME/$WORKSPACE/chroot/etc/skel/
chmod -R 777 $HOME/$WORKSPACE/chroot/etc/skel/.config

sudo mount --bind /dev $HOME/$WORKSPACE/chroot/dev
sudo mount --bind /run $HOME/$WORKSPACE/chroot/run
sudo chroot $HOME/$WORKSPACE/chroot
