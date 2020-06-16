#! /bin/sh
#
# gene.sh
# Copyright (C) 2017 crane <crane@crane-pc>
#
# Distributed under terms of the MIT license.
#


#gcc add.c --shared -o libadd.so -fPIC
gcc add.c --shared -o libadd.so -fPIC -Wl,--version-script=export.version
gcc main.c  -L. -ladd -o main
./main
