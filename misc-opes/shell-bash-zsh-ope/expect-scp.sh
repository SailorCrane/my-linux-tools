#!/usr/bin/expect -f
set timeout 60

spawn scp a galaxyeye@172.16.0.3:~

expect "password:"

set mypass 1
#exec sleep 1
send "${mypass}\r"
#interact
