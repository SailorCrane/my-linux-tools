#! /bin/sh
#
# grep-零宽断言.sh
# Copyright (C) 2017 crane <crane@crane-pc>
#
# Distributed under terms of the MIT license.
#

# 使用perl 的零宽断言: -P \K

# 注意为了不带颜色: 使用env grep
# \K 类似于vim \zs, 之后的才开始进行匹配
# -o 选项只输出匹配项

git branch -a  |env grep 'origin/HEAD' |env grep -oPe '->\s+origin/\K.*'
