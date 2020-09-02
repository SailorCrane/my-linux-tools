# vim:set foldmethod=marker  foldlevel=0: vim modeline

# search, install, uninstall, depends, rdepends software
# {{{

function apt_search {     # search: dont need root
    # {{{
    searchMsg=$1
    #apt-cache search $searchMsg | grep  $searchMsg
    apt-cache search $searchMsg
    # search gvim 可以找到vim-gnome
    # 但是 search gvim | grep gvim 一条信息都获取不到
    # 所以去掉grep
    # aptitude search $1
    # }}}
}

function apt_install {    # install need root
    # {{{
    ope=install
    isRoot      # 判断当前用户是否未root

    if isRoot
    then
        apt-get $ope $@ -y
    else             # 当前用户非root
        sudo apt-get $ope $@ -y
        # aptitude search $1
    fi
    # }}}
}

function apt_uninstall {
    # {{{
    ope=remove
    isRoot      # 判断当前用户是否未root

    if isRoot
    then
        apt-get $ope $@
    else             # 当前用户非root
        sudo apt-get $ope $@
        # aptitude search $1
    fi
    # }}}
}

function apt_depends {     # search: dont need root
    # {{{
    searchMsg=$*
    #apt-cache search $searchMsg | grep  $searchMsg
    apt-cache depends $searchMsg
    # search gvim 可以找到vim-gnome
    # 但是 search gvim | grep gvim 一条信息都获取不到
    # 所以去掉grep
    # aptitude search $1
    # }}}
}

function apt_rdepends {     # search: dont need root
    # {{{
    searchMsg=$*
    #apt-cache search $searchMsg | grep  $searchMsg
    apt-cache rdepends $searchMsg
    # search gvim 可以找到vim-gnome
    # 但是 search gvim | grep gvim 一条信息都获取不到
    # 所以去掉grep
    # aptitude search $1
    # }}}
}
# }}}


# 获取文件所属的包名
# file package
# 在filep 中, 也应该使用参数, 区分 bin, etc 和 list等功能
#                                  -b,  -c/-e, -l
# 而不是为每个功能各写一个函数, 以后注意吧
apt_filep() {
    local _file=$1

    dpkg -S $_file

    # CentOs
    #rpm  -qf  $cmd
}


# filepl
# 列出文件所属包包含的所有文件
# file package list
# 如果参数是一个目录, 因为dpkg -S /dir 会针对目录下文件循环dpkg -S, 所以列出的可能是很多包名
# 所以可能会导致程序不正确执行
# 比如 filepl  /tmp可以正确执行, 但是filepl /bin则不可以
# 不知道dpkg -S 有没有专门针对目录的选项, 类似于 ls -d这样, 查看man page
# 注意每次修改完本源文件后, source  ~/.bashrc 使之生效, 或者执行 sb (这是自定义的source ~/.bashrc 的alias)
apt_filepl() {
    # HINT: 输入的fileName在$PATH中, 或者是绝对路径都可以!
    # HINT: filep 会处理非绝对路径的filename
    UsageMsg='filepl  <fileName: [in $PATH]/[absolute path]  >'

    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    fileName=$1

    packageInfo=$(filep $fileName)
    echo packageinfo $packageInfo

    packageName=$(echo $packageInfo | env grep ":" | awk -F: '{print $1}')      # 输出中带":"的有packageName
    echo packageName $packageName

    dpkg -L $packageName
}



# filepb
# 列出文件所属包中的/bin 文件, 可执行文件
# dpkg -S, dpkg -L, grep /bin
# pb stand for package binary
apt_filepb() {
    # {{{
    UsageMsg="filepb  <fileName>"

    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    fileName=$1
    filepl  $fileName | grep bin
    # }}}
}



# filepe
# 列出安装包放在/etc中的文件
# pe stand for package etc(etc)
# filepc 和 filepb 结构几乎相同, 以后如果有
# 大量这样的功能需求, 可以提取出公共部分
apt_filepe() {
    # {{{
    UsageMsg="filepe  <fileName>"

    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    fileName=$1
    filepl  $fileName | grep etc
    # }}}
}

# apt_downgrade iproute2=4.15.0-2ubuntu1.2
# apt_downgrade [package_name]=[version]
apt_downgrade() {
    sudo apt-get install -y --allow-downgrades $1
}


# show aptitude moo, an interesting thing
apt_interest() {
# {{{
    echo "aptitude -v moo"
    aptitude -v moo
    blankLine

    echo "aptitude -vv moo"
    aptitude -vv moo
    blankLine

    echo "aptitude -vvv moo"
    aptitude -vvv moo
    blankLine

    echo "aptitude -vvvv moo"
    aptitude -vvvv moo
    blankLine

    echo "aptitude -vvvvv moo"
    aptitude -vvvvv moo
    blankLine

    echo "aptitude -vvvvvv moo"
    aptitude -vvvvvv moo
    blankLine

    echo "aptitude -vvvvvvv moo"
    aptitude -vvvvvvv moo
    blankLine
# }}}
}
alias apt-moo=apt-interest


