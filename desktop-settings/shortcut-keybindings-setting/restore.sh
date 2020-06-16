#! /bin/bash
#
# backup.sh
# Copyright (C) 2019 crane <crane@crane-sharper>
#
# Distributed under terms of the MIT license.
#

source ./base.sh

# dconf load /org/cinnamon/desktop/keybindings/ < keybindings-settings.conf
dconf load ${KeybindDconf} < ${KeybindProfile}
