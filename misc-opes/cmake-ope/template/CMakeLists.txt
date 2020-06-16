cmake_minimum_required(VERSION 2.6)
# cmake version  3.5, Ubuntu16.04
# usage: cmake <dir>.  cmake  ./

project(test)
# 使用project( pro_name )命令后
# Cmake 系统也帮助我们预定义了 PROJECT_BINARY_DIR和PROJECT_SOURCE_DIR其值与上述对应相等
# <project name>_BINARY_DIR(二进制文件保存路径)    <project name>_SOURCE_DIR（源代码路径）

# set(CMAKE_INSTALL_PREFIX " ") 必须放在project() 指令之后, 放在project()之后, 比如第二次cmake, 才可以.
set(CMAKE_INSTALL_PREFIX  ./usr)
#message("install to " ${CMAKE_INSTALL_PREFIX})

add_subdirectory(src)

