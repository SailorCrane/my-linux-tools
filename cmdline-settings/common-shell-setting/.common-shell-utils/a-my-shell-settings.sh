#! /bin/sh
#
# mySetting.sh
# Copyright (C) 2017 crane <crane@crane>
#
# Distributed under terms of the MIT license.
#

ulimit -c unlimited     # core dump unlimited

# disable c-s, c-q in terminal
stty stop  undef
stty start undef
