
cmake_minimum_required(VERSION 3.5)

project(HelloMain)
add_subdirectory(src)

# 如果要设置 CMAKE_INSTALL_PREFIX, 需要在上层目录设置
if(NOT  CMAKE_INSTALL_PREFIX)
    set(CMAKE_INSTALL_PREFIX  "./myinstall")
    #message("install prefix is ${CMAKE_INSTALL_PREFIX}")
endif()

message("install prefix is ${CMAKE_INSTALL_PREFIX}")
