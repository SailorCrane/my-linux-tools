#! /bin/sh
#
# alias-quota-postion.sh
# Copyright (C) 2017 crane <crane@crane-pc>
#
# Distributed under terms of the MIT license.
#

# "ll=something"  ------> ll="something"
sed -i -r 's/"([a-zA-Z]+)=/\1="/'  shell-setting/myAlias.sh
