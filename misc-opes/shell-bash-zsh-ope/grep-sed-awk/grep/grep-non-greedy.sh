#! /bin/sh
#
# grep-non-greedy:.sh
# Copyright (C) 2017 crane <crane@crane-pc>
#
# Distributed under terms of the MIT license.
#


# non greedy: support only by perl style re
# non-greedy, lazy, shortest

echo "greedy:"     && grep -P 'a.*'   test.txt --color
echo "non-greedy:" && grep -P 'a.*?'  test.txt --color

echo "greedy:"     && grep -P 'a.+'   test.txt --color
echo "non-greedy:" && grep -P 'a.+?'  test.txt --color

# ack 本身就是perl风格
echo "greedy:"     && ack 'a.*'   test.txt --color
echo "non-greedy:" && ack 'a.*?'  test.txt --color

echo "greedy:"     && ack 'a.+'   test.txt --color
echo "non-greedy:" && ack 'a.+?'  test.txt --color
