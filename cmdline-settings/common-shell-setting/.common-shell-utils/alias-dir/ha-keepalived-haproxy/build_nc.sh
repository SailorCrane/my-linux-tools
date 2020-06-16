#! /bin/sh
#
# build.sh
# Copyright (C) 2019 crane <crane@gosun>
#
# Distributed under terms of the MIT license.
#


sudo docker build --no-cache -t mync       . -f dockerfile_nc     # 作为nc backend server
