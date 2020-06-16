# vim:set foldmethod=marker  foldlevel=0: vim modeline
#
# prog-operation.sh
# Copyright (C) 2017 crane <crane@crane>
#
# Distributed under terms of the MIT license.
#

# 程序执行相关脚本


# file system call search
tracef() {       # file system calling
# {{{
    UsageMsg='tracef  [-e]  <command...>'

    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    # -e 选项决定是否将 错误输出重定向到标准输出
    # 因为strace的输出到 stderr
    OutTo=" "
    if [ $1 = "-e" ]
    then
        OutTo="2>&1"
        shift             # 只有左移一位, 去掉-e选项(至关重要): same as : shift 1
                          # 剩下的 $* 才能付给 strace -e 'trace=file' $*
    fi

    # 这里要加eval两遍解析: 因为第一遍将 OutTo变量解析, 第二遍解析 2>&1
    # 否则 2>&1 会被当做参数对象(比如文件对象)
    eval strace  -e  'trace=file'  $*  $OutTo       # eval 也至关重要
# }}}
}

traceo() {       # file system calling
    # {{{
    UsageMsg='traceo  [-e]  <command...>'

    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    # -e 选项决定是否将 错误输出重定向到标准输出
    # 因为strace的输出到 stderr
    OutTo=" "
    if [ $1 = "-e" ]
    then
        OutTo="2>&1"
        shift             # 只有左移一位, 去掉-e选项(至关重要): same as : shift 1
                          # 剩下的 $* 才能付给 strace -e 'trace=file' $*
    fi

    # 这里要加eval两遍解析: 因为第一遍将 OutTo变量解析, 第二遍解析 2>&1
    # 否则 2>&1 会被当做参数对象(比如文件对象)
    eval strace  -e  'trace=open'  $*  $OutTo       # eval 也至关重要
    # }}}
}

mkpro() {       # mkdir  project  directory
# {{{
    if [ $# -lt 1 ]     # 如果没有指定项目路径, 那么默认项目路径是当前路径
    then
        ProDir="./"
    else
        ProDir="$1"     # 如果指定了路径, 使用指定路径作为项目路径
        if [ ! -d  $1 ] ; then
            mkdir $1    # 只有项目路径不存在, 才创建
        fi
    fi

    cd $ProDir          # 进入项目路径, 执行下列操作

    mkdir  -p  src/  doc/  build/  bin/  lib/  include/                 # mkdir project directories
    cp /mySaved/tools-setting-linux/cmake-learn/template/CMakeLists.txt  ./      # copy a CMakeList.txt example to top CMakeLists.txt
    cp /mySaved/tools-setting-linux/cmake-learn/template/src-CMakeLists.txt ./src/CMakeLists.txt  # copy a CMakeList.txt example to ./src
# }}}
}

# 不再需要, 有相应的lscpp alias
# lssrcs() {
#     # {{{
#     set +o nomatch   # zsh to supress  wildcard parse error output

#     local  Ope="ls 2>/dev/null"

#     # array: support bash/zsh
#     srcs=(h hpp c cpp cxx sh py)

#     for  suffix in ${srcs[@]}
#     do
#         # ls 2>/dev/null  *.cpp
#         eval ${Ope}  "*.${suffix}"
#     done
#     # }}}
# }

# 计算源码行数
srcl() {
#{{{
    set +o nomatch

    # zsh递归匹配,  **/*.h
    wc -l  **/*.hpp *.cpp **/*.h **/*.c  **/*.py 2>/dev/null
#}}}
}


# LD_DEBUG 是 glibc 中的 loader 为了方便自身调试而设置的一个环境变量.
# 通过设置这个环境变量，可以方便的看到 loader 的加载过程。
ldhelp() {
    LD_DEBUG=help ls
}

ldlibs() {
#{{{
    UsageMsg='ldlibs  <command...>'

    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    LD_DEBUG=libs  $@
#}}}
}

# use valgrind test memory leak
leak() {
#{{{
    UsageMsg='leak <YouCmd and args>'

    if ! ParaUsage "${UsageMsg}" 1 $* ; then
        return -1
    fi

    # default tool is memcheck, don't need --tool=memcheck
    #local Ope="valgrind --tool=memcheck --leak-check=full"
    local Ope="valgrind --leak-check=full"
    local YouCmd=$*

    eval $Ope "${YouCmd}"   # zsh need eval
#}}}
}

# 使用valgrind + kcachegrind分析程序性能
myperf() {
    # {{{
    UsageMsg='myperf <YouCmd and args>'

    if ! ParaUsage "${UsageMsg}" 1 $* ; then
        return -1
    fi

    #valgrind --tool=callgrind -v --dump-every-bb=10000000 ./YouCmd
    local Ope="valgrind --tool=callgrind --separate-threads=yes"

    local YouCmd=$*

    eval $Ope "${YouCmd}"   # zsh need eval

    if [ ! $? ] ; then
        return -1
    fi

    # 使用kcachegrind 查看valgrind分析的日志
    nohup kcachegrind &
    # }}}
}


# gdb/cgdb debug core
core() {
#{{{
    UsageMsg='core <exec_file> [core_file]'

    if ! ParaUsage "${UsageMsg}" 1 $* ; then
        return -1
    fi

    exec_file=$1

    if [ $# -eq 1 ] ; then
        core_file="core"
    elif [ $# -eq 2 ]; then
        core_file=$2
    else
        failureMsg "${UsageMsg}"
        return -1
    fi

    cgdb $exec_file $core_file
#}}}
}

choose() {
#{{{
    # 注意: alias不会变成$0, 只有有文件的(软链接, 硬链接才会变为$0)
    UsageMsg="$0 <PROGRAM>"

    if ! ParaUsage "${UsageMsg}" 1 $* ; then
        echo "example: $0 vim"
        echo "example: $0 java"
        return -1
    fi

    PROGRAM=$1
    # 因为可能需要在/usr/bin, /usr/local/bin创建软链接等, 需要使用sudo
    sudo update-alternatives --config $PROGRAM
#}}}
}
alias alter=choose
