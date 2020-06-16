#!/usr/bin/env  bash
#
# mk_test_dir.sh
# Copyright (C) 2017 crane <crane@crane-pc>
#
# Distributed under terms of the MIT license.
#


echo "starting to mkdir essential  directories"

# 必须在bash下执行(sh不支持{}写法)
mkdir  -p  ~/test/{c++,c,java,python,scheme,vim,bash,zsh,make,git,mess,cmake,docker,django,qt}
mkdir  -p  ~/Share-With-Windows/{video,book,doc}        # 虚拟机用来和Windows共享文件系统

