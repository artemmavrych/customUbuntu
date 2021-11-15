#!/bin/bash
source configuration.txt

cd $HOME/$WORKSPACE

cat <<EOF > image/README.diskdefines
#define DISKNAME  Ubuntu from scratch
#define TYPE  binary
#define TYPEbinary  1
#define ARCH  amd64
#define ARCHamd64  1
#define DISKNUM  1
#define DISKNUM1  1
#define TOTALNUM  0
#define TOTALNUM0  1
EOF











#cd $HOME/$WORKSPACE/image


cat <<EOF> image/isolinux/isolinux.cfg
UI vesamenu.c32

MENU TITLE Boot Menu
DEFAULT linux
TIMEOUT 600
MENU RESOLUTION 640 480
MENU COLOR border       30;44   #40ffffff #a0000000 std
MENU COLOR title        1;36;44 #9033ccff #a0000000 std
MENU COLOR sel          7;37;40 #e0ffffff #20ffffff all
MENU COLOR unsel        37;44   #50ffffff #a0000000 std
MENU COLOR help         37;40   #c0ffffff #a0000000 std
MENU COLOR timeout_msg  37;40   #80ffffff #00000000 std
MENU COLOR timeout      1;37;40 #c0ffffff #00000000 std
MENU COLOR msg07        37;40   #90ffffff #a0000000 std
MENU COLOR tabmsg       31;40   #30ffffff #00000000 std

LABEL linux
 MENU LABEL Try SBUbuntu
 MENU DEFAULT
 KERNEL /casper/vmlinuz
 APPEND initrd=/casper/initrd boot=casper

LABEL linux
 MENU LABEL Try SBUbuntu (nomodeset)
 MENU DEFAULT
 KERNEL /casper/vmlinuz
 APPEND initrd=/casper/initrd boot=casper nomodeset
EOF


apt install -y syslinux-common && \
cp /usr/lib/ISOLINUX/isolinux.bin isolinux/ && \
cp /usr/lib/syslinux/modules/bios/* isolinux/

sudo xorriso \
   -as mkisofs \
   -iso-level 3 \
   -full-iso9660-filenames \
   -volid "$NAME" \
   -output "$NAME"_"$VERSION".iso" \
 -isohybrid-mbr /usr/lib/ISOLINUX/isohdpfx.bin \
 -eltorito-boot \
     isolinux/isolinux.bin \
     -no-emul-boot \
     -boot-load-size 4 \
     -boot-info-table \
     --eltorito-catalog isolinux/isolinux.cat \
 -eltorito-alt-boot \
     -e /EFI/boot/efiboot.img \
     -no-emul-boot \
     -isohybrid-gpt-basdat \
 -append_partition 2 0xef EFI/boot/efiboot.img \
   "$HOME/live-ubuntu-from-scratch/image"






#grub-mkstandalone \
#   --format=x86_64-efi \
#   --output=isolinux/bootx64.efi \
#   --locales="" \
#   --fonts="" \
#   "boot/grub/grub.cfg=isolinux/grub.cfg"
#
#(
#   cd isolinux && \
#   dd if=/dev/zero of=efiboot.img bs=1M count=10 && \
#   sudo mkfs.vfat efiboot.img && \
#   LC_CTYPE=C mmd -i efiboot.img efi efi/boot && \
#   LC_CTYPE=C mcopy -i efiboot.img ./bootx64.efi ::efi/boot/
#)
#
#
#grub-mkstandalone \
#   --format=i386-pc \
#   --output=isolinux/core.img \
#   --install-modules="linux16 linux normal iso9660 biosdisk memdisk search tar ls" \
#   --modules="linux16 linux normal iso9660 biosdisk search" \
#   --locales="" \
#   --fonts="" \
#   "boot/grub/grub.cfg=isolinux/grub.cfg"
#
#
#cat /usr/lib/grub/i386-pc/cdboot.img isolinux/core.img > isolinux/bios.img
#
#sudo /bin/bash -c "(find . -type f -print0 | xargs -0 md5sum | grep -v -e 'md5sum.txt' -e 'bios.img' -e 'efiboot.img' > md5sum.txt)"
#
#sudo xorriso \
#   -as mkisofs \
#   -iso-level 3 \
#   -full-iso9660-filenames \
#   -volid "$NAME" \
#   -output "../"$NAME"_"$VERSION".iso" \
#   -eltorito-boot boot/grub/bios.img \
#      -no-emul-boot \
#      -boot-load-size 4 \
#      -boot-info-table \
#      --eltorito-catalog boot/grub/boot.cat \
#      --grub2-boot-info \
#      --grub2-mbr /usr/lib/grub/i386-pc/boot_hybrid.img \
#   -eltorito-alt-boot \
#      -e EFI/efiboot.img \
#      -no-emul-boot \
#   -append_partition 2 0xef isolinux/efiboot.img \
#   -m "isolinux/efiboot.img" \
#   -m "isolinux/bios.img" \
#   -graft-points \
#      "/EFI/efiboot.img=isolinux/efiboot.img" \
#      "/boot/grub/bios.img=isolinux/bios.img" \
#      "."

ls -lh $HOME/$WORKSPACE/*.iso
