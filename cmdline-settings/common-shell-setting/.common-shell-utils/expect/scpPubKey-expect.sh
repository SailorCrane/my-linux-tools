#!/usr/bin/expect
set timeout 60

set copyKeyFile [lindex $argv 0]
set username    [lindex $argv 1]
set hostname    [lindex $argv 2]
set mypass      [lindex $argv 3]

set homeKeyFile [lindex $argv 4]

#send "${homeKeyFile} home key\n"

spawn   scp  "${copyKeyFile}"  $username@$hostname:~
#expect "password:"  { send  "{mypass}\r" }
expect "password:"  {send  "${mypass}\r"}

spawn  ssh  $username@$hostname
#expect "password:" { send  "{mypass}\r" }
expect "password:"  {send  "${mypass}\r"}

# 加-p, 即使目录存在, 也不会出错
send  "mkdir -p ~/.ssh/\r"

send  "cat  $homeKeyFile  >>  ~/.ssh/authorized_keys\r"
send  "rm  -f $homeKeyFile \r"
send  "exit\r"
#interact
