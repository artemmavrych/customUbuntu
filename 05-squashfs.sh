#!/bin/bash
source configuration.txt

sudo umount $HOME/$WORKSPACE/chroot/dev
sudo umount $HOME/$WORKSPACE/chroot/run

cd $HOME/$WORKSPACE
mkdir -p image/{casper,isolinux,install}
sudo cp chroot/boot/vmlinuz-**-**-generic image/casper/vmlinuz
sudo cp chroot/boot/initrd.img-**-**-generic image/casper/initrd
sudo cp chroot/boot/memtest86+.bin image/install/memtest86+
wget --progress=dot https://www.memtest86.com/downloads/memtest86-usb.zip -O image/install/memtest86-usb.zip
unzip -p image/install/memtest86-usb.zip memtest86-usb.img > image/install/memtest86
rm -f image/install/memtest86-usb.zip

cd $HOME/$WORKSPACE

touch image/ubuntu

cat <<EOF > image/isolinux/grub.cfg

search --set=root --file /ubuntu

insmod all_video

set default="0"
set timeout=30

#menuentry "Install $NAME" {
#   linux /casper/vmlinuz boot=casper nopersistent toram quiet splash ---
#   initrd /casper/initrd
#}
#menuentry "Try Ubuntu FS without installing" {
#   linux /casper/vmlinuz boot=casper nopersistent toram quiet splash ---
#  initrd /casper/initrd
#}
#
menuentry "Install $NAME" {
   linux /casper/vmlinuz boot=casper only-ubiquity quiet splash ---
   initrd /casper/initrd
}

EOF

cd $HOME/$WORKSPACE
sudo chroot chroot dpkg-query -W --showformat='${Package} ${Version}\n' | sudo tee image/casper/filesystem.manifest
sudo cp -v image/casper/filesystem.manifest image/casper/filesystem.manifest-desktop
sudo sed -i '/ubiquity/d' image/casper/filesystem.manifest-desktop
sudo sed -i '/casper/d' image/casper/filesystem.manifest-desktop
sudo sed -i '/discover/d' image/casper/filesystem.manifest-desktop
sudo sed -i '/laptop-detect/d' image/casper/filesystem.manifest-desktop
sudo sed -i '/os-prober/d' image/casper/filesystem.manifest-desktop

cd $HOME/$WORKSPACE
sudo mksquashfs chroot image/casper/filesystem.squashfs
printf $(sudo du -sx --block-size=1 chroot | cut -f1) > image/casper/filesystem.size
