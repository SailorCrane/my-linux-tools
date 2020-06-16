#!/usr/bin/expect
# 注意使用env expect 执行是, 不能加-f选项
# send, expect, spawn, interact是expect的子命令
set timeout 60

spawn ssh galaxyeye@172.16.0.3
expect "password:"

set mypass 1
#exec sleep 1
send "${mypass}\r"

interact
