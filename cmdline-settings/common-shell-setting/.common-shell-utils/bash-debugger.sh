#! /bin/sh
#
# bashdb.sh
# Copyright (C) 2017 crane <crane@crane-pc>
#
# Distributed under terms of the MIT license.

# bash debug

Version="1.0"
VersionInfo="bash Debugger version ${Version}"

# 去掉程序名的路径
DbName=${0##*/}

UsageInfo="Usage: ${DbName} <scriptName>"

bashdb() {

    echo $VersionInfo

    if (( $# < 1 )) ; then
        echo $UsageInfo
        return 1
    fi
}
