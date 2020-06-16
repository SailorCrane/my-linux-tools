#! /bin/sh
#
# non-greedy.sh
# Copyright (C) 2017 crane <crane@crane-pc>
#
# Distributed under terms of the MIT license.
#

# ack 本身就是perl风格
echo "greedy:"     && ack 'a.*'   test.txt --color
echo "non-greedy:" && ack 'a.*?'  test.txt --color

echo "greedy:"     && ack 'a.+'   test.txt --color
echo "non-greedy:" && ack 'a.+?'  test.txt --color
