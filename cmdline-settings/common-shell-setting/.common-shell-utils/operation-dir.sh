#! /bin/sh
# vim: set foldmethod=marker  foldlevel=0: vim modeline( set )
#
# dir-operation.sh
# Copyright (C) 2017 crane <crane@crane-pc>
#
# Distributed under terms of the MIT license.
#

# 注意不要和wd_add函数重名(已经被wd插件占用)
function my_wd_add {
# {{{
    fun_name="my_wd_add/wa"
    UsageMsg="${fun_name}  "
    UsageMsg2="${fun_name}  [dir_name]"
    UsageMsg3="${fun_name}  [point_name]  [dir_name]"

    saved_OLDPWD=$OLDPWD    # save $OLDPWD
    saved_PWD=$PWD

    dir_name=$PWD
    point_name=$(basename $dir_name)

    # --help
    if [ $# -eq 1 ]; then
        case "$1" in
            "-h" | "--help")      # help
                successMsg "$UsageMsg"
                successMsg "$UsageMsg2"
                successMsg "$UsageMsg3"
                return 0
                ;;
        esac
    fi

    # wa dir
    if [ $# -eq 1 ]; then
        dir_name=$1
        point_name=$(basename $dir_name)
    fi

    # wa name dir
    if [ $# -eq 2 ]; then
        point_name=$1
        dir_name=$2
    fi

    # echo $point_name
    # echo $dir_name

    cd $dir_name
    wd add! $point_name

    cd $saved_OLDPWD    # restore old pwd(cd -)
    cd $saved_PWD       # restore pwd

    #OLDPWD=$saved_OLDPWD    # restore OLDPWD
# }}}
}
alias wa=my_wd_add
