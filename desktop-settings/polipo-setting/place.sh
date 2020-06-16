#! /bin/sh
#
# place.sh
# Copyright (C) 2018 crane <crane@crane-pc>
#
# Distributed under terms of the MIT license.
#

sudo cp ./config /etc/polipo/config

service polipo restart


# # http_proxy variable is a special variable for linux(也支持ftp_proxy)
# export http_proxy=http_proxy=http://127.0.0.1:8123 https_proxy=https_proxy=http://127.0.0.1:8123

# # test(也支持ftp_proxy)
# env  http_proxy=http_proxy=http://127.0.0.1:8123 https_proxy=https_proxy=http://127.0.0.1:8123  curl ip.sb
