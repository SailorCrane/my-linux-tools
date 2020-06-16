#! /bin/sh
#
# run.sh
# Copyright (C) 2017 crane <crane@crane-pc>
#
# Distributed under terms of the MIT license.
#



run() {
    img=$1
    sudo docker  run -p 22222:22  -d  $img  /sshd.sh
}

run $1
