#! /bin/sh
#
# my-startup.sh
# Copyright (C) 2017 crane <crane@crane-pc>
#
# Distributed under terms of the MIT license.

# NOTE: 开机后, 只运行一次的功能(根据环境变量判断)

clear_depths_for_zsh() {
    # zsh 在*无法匹配时, 会有问题.
    # 不过此函数只在系统启动时执行一次

    # 直接删除目录, depth相关显示函数会自行创建
    rm -rf ~/.zsh_depth
    #if ! [ -e ~/.zsh_depth ]; then
    #    #echo 'no exist ~/.zsh_depth'
    #    return
    #fi

    #env rm -rf  ~/.zsh_depth/*
}


GolangEnv() {
    export GOPROXY="https://mirrors.aliyun.com/goproxy/"        # go mod 使用代理
    export PATH=$PATH:$HOME/go/bin                              #
    export GO111MODULE=on                                       # 默认开启go mod
}

V2rayBinPATH() {
    export PATH=$PATH:/usr/bin/v2ray/
}

PythonBinPATH() {
    #export PATH=$PATH:$HOME/.local/bin/
    export PATH=$PATH:$HOME/.local/bin          # 去掉末尾的"/"
}


CommonBinPATH() {
    export PATH=$PATH:~/.common-shell-utils/bin
}


ssClientRun() {
    # TODO: 弄成service也可以
    ss_client >/dev/null 2>&1       # NOTE: 必须放在CommonBinPATH之后, 此时才能找到ss_client
}

do_start_only_action() {
    xmodmap   ~/.Xmodmap # for mint(交换Ctrl和CapsLock键), WARNING: 为什么不起作用(在gosun主机上)?

    clear_depths_for_zsh # clear zsh depth files

    PythonBinPATH        # python bin PATH
    GolangEnv        # 设置Golang bin PATH
    V2rayBinPATH         # v2ray
    CommonBinPATH        # ~/.common-shell-utils/bin 加入PATH

    # ssClientRun          # 必须放在CommonBinPATH之后, 有了v2ray服务之后, 这个就不需要了
}



# 如果变量为空, 说明系统刚启动
if [ -z $Crane_System_Start ]; then
    do_start_only_action
    echo "do startup only operation, only do once"
    export Crane_System_Start="1"
fi

