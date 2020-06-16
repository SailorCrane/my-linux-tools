#!/usr/bin/expect
set timeout 60

# key最少要5个字符
spawn  ssh-keygen -t rsa -P ''

# 类似与条件语句, 出现which时才执行, re是regular 正则表达式
expect -re  "which"  {send "\r" }

# 如果没有出现Overwrite呢?
expect -re  "Overwrite"  { send "y\r" }

