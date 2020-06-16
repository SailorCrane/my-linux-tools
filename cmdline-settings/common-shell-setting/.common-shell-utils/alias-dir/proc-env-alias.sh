# vim: set filetype=sh  foldlevel=0: vim modeline( set )

view_proc() {
    local Pid=$1
    local FileSuffix=$2

    if (( $# < 2 )) ; then
        echo "Usage: Please pecify [pid]"
        return
    fi

    # NOTE: 指定view 命令, 比如指定strings 查看"\0"分割的/proc/pid/environ字符串
    local ViewCmd=cat
    if (( $# >= 3 )) ; then
        ViewCmd="$3"
    fi

    local File="/proc/$Pid/$FileSuffix"

    # 根据文件的可读权限, 判断是否使用sudo
    # 人怎么做, 就让机器怎么做.
    if [ -r $File ]; then
        $ViewCmd $File
    else
        sudo $ViewCmd $File
    fi
}

environ() {
    if (( $# < 1 )) ;then
        echo "Usage: Please pecify [pid]"
        return
    fi

    view_proc $1 environ strings        # 使用strings命令查看
}


cmdline() {
    view_proc $1 cmdline
}
