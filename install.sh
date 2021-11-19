#!/bin/bash
wget https://raw.githubusercontent.com/artemmavrych/customUbuntu/main/01-preq.sh
wget https://raw.githubusercontent.com/artemmavrych/customUbuntu/main/02-debootstrap.sh
wget https://raw.githubusercontent.com/artemmavrych/customUbuntu/main/03-chroot-settings.sh
wget https://raw.githubusercontent.com/artemmavrych/customUbuntu/main/04-chroot-networkClearExit.sh
wget https://raw.githubusercontent.com/artemmavrych/customUbuntu/main/05-squashfs.sh
wget https://raw.githubusercontent.com/artemmavrych/customUbuntu/main/06-BiosUEFI_ISO.sh
wget https://github.com/artemmavrych/customUbuntu/raw/main/xfce4-panel-menu\(16\).png
wget https://github.com/artemmavrych/customUbuntu/raw/main/xfce4-panel-menu\(22\).png
wget https://github.com/artemmavrych/customUbuntu/raw/main/xfce4-panel-menu\(24\).png
wget https://github.com/artemmavrych/customUbuntu/raw/main/xfce4-panel-menu\(32\).png
wget https://github.com/artemmavrych/customUbuntu/raw/main/xfce4-panel-menu\(48\).png
wget https://github.com/artemmavrych/customUbuntu/raw/main/wallpaper.png
wget https://github.com/artemmavrych/customUbuntu/raw/main/wallpaper.jpg
wget https://github.com/artemmavrych/customUbuntu/raw/main/themeWinLike.zip
wget https://github.com/artemmavrych/customUbuntu/raw/main/WinIcons.tar.gz
wget https://github.com/artemmavrych/customUbuntu/raw/main/config.tar.gz
wget https://github.com/artemmavrych/customUbuntu/raw/main/200.png

unzip themeWinLike.zip
rm -rf themeWinLike.zip

tar -xvf config.tar.gz
rm -rf config.tar.gz

tar -xvf WinIcons.tar.gz
rm -rf WinIcons.tar.gz

mv Windows-10-Dark-master theme
mv WinIcons icons

chmod 755 *
