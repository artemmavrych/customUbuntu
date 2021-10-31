#!/bin/bash
wget https://raw.githubusercontent.com/artemmavrych/customUbuntu/main/01-preq.sh
wget https://raw.githubusercontent.com/artemmavrych/customUbuntu/main/configuration.txt
wget https://raw.githubusercontent.com/artemmavrych/customUbuntu/main/02-debootstrap.sh
wget https://raw.githubusercontent.com/artemmavrych/customUbuntu/main/03_denos_chroot_lxqt.sh
wget https://raw.githubusercontent.com/artemmavrych/customUbuntu/main/04_denos_MakeSquashfs.sh
wget https://raw.githubusercontent.com/artemmavrych/customUbuntu/main/05_denos_BiosUEFI_ISO.sh

chmod 755 *.sh
