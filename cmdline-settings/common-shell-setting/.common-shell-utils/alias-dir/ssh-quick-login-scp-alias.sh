#!/bin/sh

alias ubuntu="ssh -p 7337 ubuntu"                   # ubuntu

alias jump="ssh wanghe@jump.mminternal.com -p 6666" # jump定义在"work项目"中的 hosts中.
#alias old="ssh uaq@101.71.28.84 -p 7000"           # test old
alias old="ssh uaq@oldjump -p 7000"                 # test old
alias pre26="ssh -p 6022 uaq@localhost"             # 预发布, 需要通过oldjump跳转. 需要通过oldjump做 remote-forward

Ssh50Port="5022"
Ssh50Host="crane@localhost"
alias 22="ssh -p 2022 root@localhost"            # 测试环境, 需通过oldjump跳转.
alias 50="ssh -p $Ssh50Port $Ssh50Host"            # 测试环境, 需通过oldjump跳转.
# alias 50="ssh -p 7777 crane@flux50"               # test 50

alias 13="ssh -p 3022 dev@localhost"                # 13 生产环境
alias 18="ssh -p 3023 dev@localhost"                # 18 生产环境




quick_push() {
    Url=$1
    Port=$2
    # shift 2
    LocalPath=$3     # 可以是文件或者目录

    RemotePath="/tmp"
    if [[ $# == 4 ]] ;then
        RemotePath=$4
    fi
    echo "remotePath is $RemotePath"

    scp -r -P $Port $LocalPath $Url:$RemotePath
}

quick_pull() {
    Url=$1
    Port=$2
    # shift 2
    RemotePath=$3     # 可以是文件或者目录

    LocalPath="/tmp"
    if [[ $# == 4 ]] ;then
        LocalPath=$4
        # echo "$#"
    fi
    echo "localPath is $LocalPath"

    scp -r -P $Port $Url:$RemotePath $LocalPath
}


alias ubuntup="quick_push crane@ubuntu 7337"
# alias 50p="quick_push crane@122.228.212.146 7777"
alias 50p="quick_push $Ssh50Host $Ssh50Port"
alias 22p="quick_push root@localhost 2022"
alias oldp="quick_push uaq@101.71.28.84 7000"
alias pre26p="quick_push uaq@localhost 6022"
alias 13p="quick_push dev@localhost 3022"
#alias 18p="quick_push uaq@localhost 3023"
alias 18p="quick_push dev@localhost 3023"


alias ubuntul="quick_pull crane@ubuntu 7337"
alias 50l="quick_pull $Ssh50Host $Ssh50Port"
alias 22l="quick_pull root@localhost 2022"
alias oldl="quick_pull uaq@101.71.28.84 7000"
alias pre26l="quick_pull uaq@localhost 6022"
alias 13l="quick_pull dev@localhost 3022"
alias 18l="quick_pull dev@localhost 3023"
