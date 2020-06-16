#! /bin/sh
#
# restore.sh
# Copyright (C) 2020 crane <crane@crane-sharper>
#
# Distributed under terms of the MIT license.
#

EtcConfig="/etc/docker/daemon.json"
MyFile="./daemon.json"

if [ -e ${EtcConfig} ] ; then
    sudo cp  $EtcConfig  ${EtcConfig}-$(date +"%Y-%m-%d-%k:%M:%S")       # backup
fi

sudo cp  $MyFile ${EtcConfig}
