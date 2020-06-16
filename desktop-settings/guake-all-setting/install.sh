#! /bin/bash

source ./base.sh

pip3 install --user guake               # 安装guake到user用户空间

cp ./${AutoStart}  ${AutoStartDir}  -f  # 添加开机自动启动

cp ./${GuakeDesk}    ${MenuAppsDir}  -f # 添加guake到左下角的Menu中
cp ./${PrefDesk}     ${MenuAppsDir}  -f # 添加preference到左下角Menu


# 如果没有guake进程, 启动guake
if ! ps -ef | grep guake | grep -v -w vim | grep -v -w vi | grep -v grep ; then
    nohup guake -f &
fi
