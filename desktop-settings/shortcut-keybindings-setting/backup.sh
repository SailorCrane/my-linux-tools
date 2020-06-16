#! /bin/bash
#
# backup.sh
# Copyright (C) 2019 crane <crane@crane-sharper>
#
# Distributed under terms of the MIT license.
#


source ./base.sh

dconf dump ${KeybindDconf} > ${KeybindProfile}
