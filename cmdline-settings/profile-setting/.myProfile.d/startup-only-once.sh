#! /bin/sh
#
# my-startup.sh
# Copyright (C) 2017 crane <crane@crane-pc>
#
# Distributed under terms of the MIT license.

# NOTE: 开机后, 只运行一次的功能(根据环境变量判断)

source /Users/crane/.myProfile.d/base


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
    # export PATH=$PATH:$HOME/go/bin                              #
    AppendPathIfNotExist $HOME/go/bin
    export GOPATH=$HOME/go/        #

    # export GO111MODULE=on                                       # 默认开启go mod
    # export GOPROXY="https://mirrors.aliyun.com/goproxy/"        # go mod 使用代理
}

Php_ComposerPATH() {
    # export PATH=$PATH:$HOME/.composer/vendor/bin
    # export PATH="/usr/local/opt/php@7.1/bin:$PATH"
    # export PATH="/usr/local/opt/php@7.1/sbin:$PATH"

    AppendPathIfNotExist $HOME/.composer/vendor/bin

    AppendPathIfNotExist /usr/local/opt/php@7.1/bin
    AppendPathIfNotExist /usr/local/opt/php@7.1/sbin

}

NvmPATH() {
    # 默认 shell 为 zsh 的, 完成以上步骤之后还需要创建 ~/.zshrc, 并添加以下语句
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

V2rayBinPATH() {
    # export PATH=$PATH:/usr/bin/v2ray/
    AppendPathIfNotExist /usr/bin/v2ray/
}

PythonBinPATH() {
    #export PATH=$PATH:$HOME/.local/bin/
    # export PATH=$PATH:$HOME/.local/bin          # 去掉末尾的"/"
    AppendPathIfNotExist $HOME/.local/bin
}


CommonBinPATH() {
    # export PATH=$PATH:$HOME/.common-shell-utils/bin
    AppendPathIfNotExist $HOME/.common-shell-utils/bin
}


HomeBrewCommandNotFound() {
    # NOTE: neew  "brew tap homebrew/command-not-found"
    if is_mac; then
        local HB_CNF_HANDLER="$(brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
        if [ -f "$HB_CNF_HANDLER" ]; then
            source "$HB_CNF_HANDLER";
        else
            echo "Do not exist [homebrew-command-not-found], need exec [brew tap homebrew/command-not-found]"
        fi
    fi
}


ssClientRun() {
    # TODO: 弄成service也可以
    ss_client >/dev/null 2>&1       # NOTE: 必须放在CommonBinPATH之后, 此时才能找到ss_client
}

run_xmodmap() {
    if env which xmodmap 1>/dev/null 2>/dev/null; then
        xmodmap   ~/.Xmodmap # for mint(交换Ctrl和CapsLock键), WARNING: 为什么不起作用(在gosun主机上)?
    else
        echo "[xmodmap] do not exist!"
    fi
}

do_start_only_action() {
    run_xmodmap

    clear_depths_for_zsh # clear zsh depth files

    PythonBinPATH        # python bin PATH
    GolangEnv            # 设置Golang bin PATH
    Php_ComposerPATH     # php composer
    NvmPATH              # nvm

    V2rayBinPATH         # v2ray
    CommonBinPATH        # ~/.common-shell-utils/bin 加入PATH

    # ssClientRun          # 必须放在CommonBinPATH之后, 有了v2ray服务之后, 这个就不需要了

    HomeBrewCommandNotFound
}


# 如果变量为空, 说明系统刚启动
if [ -z $Crane_System_Start ]; then
    do_start_only_action
    echo "do startup only operation, only do once"
    export Crane_System_Start="1"
fi

