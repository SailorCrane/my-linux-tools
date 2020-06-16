#! /bin/sh
#
# grep-跨行搜索.sh
# Copyright (C) 2017 crane <crane@crane-pc>
#
# Distributed under terms of the MIT license.
#

# 搜索python文件, -P perl风格
# 没有找到ack 等价, 所以才用grep
grep -Pzo pattern  $(ack -f --py)
