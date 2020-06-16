cmake_minimum_required(VERSION 3.5)

project(HelloLib)

add_subdirectory(src)

#set(CMAKE_INSTALL_PREFIX ./loc)

message("path is $ENV{PATH}")

#install(TARGETS  hello hello_static
        #LIBRARY DESTINATION  lib
        #ARCHIVE DESTINATION  lib
        #)

#install (FILES  hello.hpp  DESTINATION  include)
