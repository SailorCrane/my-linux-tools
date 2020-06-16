#! /bin/sh
#
# source-virtualenvwrapper.sh
# Copyright (C) 2018 crane <crane@crane-pc>
#
# Distributed under terms of the MIT license.
#

# 1: 这里不设置 WORKON_HOME的话,会有默认值在 virtualenvwrapper.sh中设置
#export WORKON_HOME=${HOME}/.virtualenvs

# 2: 需要source, 才能使用其中的变量: mkvirtualenv, workon函数
VE_WRAPPER1="/usr/local/bin/virtualenvwrapper.sh"
VE_WRAPPER2="/usr/bin/virtualenvwrapper.sh"

if [ -e $VE_WRAPPER1  ]; then
    source $VE_WRAPPER1
fi

if [ -e $VE_WRAPPER2  ]; then
    source $VE_WRAPPER2
fi


