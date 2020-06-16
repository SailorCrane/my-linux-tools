#! /bin/sh
#
# backup.sh
# Copyright (C) 2020 crane <crane@crane-sharper>
#
# Distributed under terms of the MIT license.
#

CFG_FILE="/etc/docker/daemon.json"
MY_FILE="./daemon.json"

sudo cp  $MY_FILE   ${MY_FILE}-$(date +"%Y-%m-%d-%k:%M:%S")       # backup
cp  $CFG_FILE   ${MY_FILE} -f
