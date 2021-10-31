#!/bin/bash
wget https://raw.githubusercontent.com/artemmavrych/customUbuntu/main/01-preq.sh
wget https://raw.githubusercontent.com/artemmavrych/customUbuntu/main/configuration.txt
wget https://raw.githubusercontent.com/artemmavrych/customUbuntu/main/02-debootstrap.sh
wget https://raw.githubusercontent.com/artemmavrych/customUbuntu/main/03-chroot-settings.sh
wget https://raw.githubusercontent.com/artemmavrych/customUbuntu/main/04-chroot-networkClearExit.sh
wget https://raw.githubusercontent.com/artemmavrych/customUbuntu/main/05-squashfs.sh
wget https://raw.githubusercontent.com/artemmavrych/customUbuntu/main/06-BiosUEFI_ISO.sh

chmod 755 *.sh
