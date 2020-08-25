#! /bin/sh
#
# ls-alias.sh
# Copyright (C) 2020 crane <crane@crane-pc>
#
# Distributed under terms of the MIT license.
#

alias ll="ls -l -G " # 显示详细信息, 带颜色
alias ls="ls -G"    # 永远显示颜色, 这样被管道 | less -R 查看时, 不会丢失颜色
