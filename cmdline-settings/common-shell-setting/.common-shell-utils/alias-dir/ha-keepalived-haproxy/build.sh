#! /bin/sh
#
# build.sh
# Copyright (C) 2019 crane <crane@gosun>
#
# Distributed under terms of the MIT license.
#


sudo docker build --no-cache -t mync       . -f dockerfile_nc     # 作为nc backend server
sudo docker build --no-cache -t myhabase   . -f dockerfile_habase   # 安装haproxy, keepalived
sudo docker build --no-cache -t myhaproxy  . -f dockerfile_haproxy           # 放入haproxy, keepalived配置文件等
