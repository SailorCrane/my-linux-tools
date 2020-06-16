#!/usr/bin/env  bash
# vim:set foldmethod=marker  foldlevel=0: vim modeline

#===================================================
# Description:
# 脚本包括 使用mkdir创建目录, 修改文件权限.
# 安装必备软件.
#===================================================


#===================================================
# WARNING:
# 这个脚本不要使用source或者"."执行, 直接执行脚本.
# 这样当前脚本的变量, 不会"弄脏"当前bash进行中的变量
#===================================================


#1: mkdir test/*  dir
# -p auto create ~/test/ dir
# {{{
echo "starting to mkdir essential  directories"
mkdir  -p  ~/test/{c++,c,java,python,scheme,vim,bash,zsh,make,git,mess}
mkdir  -p  ~/Share-With-Windows/{video,book,doc}        # 虚拟机用来和Windows共享文件系统

# }}}

#2: mkdir mySaved, myWork, myTools
# {{{
# 路径变量, 一般不要以"/"结尾, 这样就可以组合其它路径. 否则无法组合
# 比如 dir=/tmp  $dir/test是OK的.
# 但是 dir=/tmp/ $dir/test 就成了/tmp//test
SavedDir=/mySaved
 WorkDir=/myWork
SavedCodeDir=$SavedDir/myCode
 WorkCodeDir=$WorkDir/myCode

 ToolsDir=/myTools

sudo mkdir  -p   $SavedCodeDir  $WorkCodeDir $ToolsDir
# 修改文件拥有者: 因为是用sudo创建的, 创建完毕后是属于root的目录
# USER变量(Bash提供), 在执行sudo前, 已经被bash替换为常量了
sudo chown  $USER:$USER  $SavedDir  $WorkDir  $ToolsDir -R

# }}}

#3 install essential software
# {{{
echo "start to install essential  Software Tools"

Inser=apt-get   # stand for install-er
Sudo=sudo       # 有可能某些时候不需要sudo, 那么赋值Sudo=""即可
Oper=install    # stand for operation

# 这里添加一个函数: 用于检测软件是否安装 + 如果没有安装(再安装)

$Sudo $Inser $Oper vim
$Sudo $Inser $Oper vim-gnome
$Sudo $Inser $Oper htop
$Sudo $Inser $Oper iotop

# }}}
