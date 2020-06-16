#! /bin/bash
#
# uninstall.sh
# Copyright (C) 2020 crane <crane@sharp>
#
# Distributed under terms of the MIT license.
#

source ./base.sh

pip3 uninstall guake


echo "will remove autostart file of 'guake'"
rm -f ${AutoStartDir}/${AutoStart}

echo "will remove menu-app item of 'guake'"
sudo rm -f ${MenuAppsDir}/${GuakeDesk}
sudo rm -f ${MenuAppsDir}/${PrefDesk}
