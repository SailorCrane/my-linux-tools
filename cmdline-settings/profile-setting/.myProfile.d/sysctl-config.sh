#! /bin/sh
#
# sysctl-config.sh
# Copyright (C) 2020 crane <crane@sharp>
#
# Distributed under terms of the MIT license.
#


my_sysctl_config() {
    #sudo sysctl vm.swappiness=0     # 内存使用完毕前, 禁用swap
    sysctl vm.swappiness=0     # 内存使用完毕前, 禁用swap
}

my_sysctl_config
