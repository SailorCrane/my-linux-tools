# cmake version  3.5, Ubuntu16.04
# usage: cmake <dir>.  cmake  ./

CMAKE_MINIMUM_REQUIRED(VERSION 3.5)
PROJECT(bdb-test)
# 使用project( pro_name )命令后
# Cmake 系统也帮助我们预定义了 PROJECT_BINARY_DIR和PROJECT_SOURCE_DIR其值与上述对应相等
# <project name>_BINARY_DIR(二进制文件保存路径)    <project name>_SOURCE_DIR（源代码路径）

SET(need Two.cpp utils.cpp MyDb/MyDb.cpp)
ADD_EXECUTABLE(create-index  create-index.cpp ${need})

ADD_DEFINITIONS(-std=c++11 -Wall  -O3)      # compile flags approach 1
#SET( CXX_FLAGS                               # compile flags approach 2, but does not wor
     #-g
     #-std=c++11
     #-Wall
     #-O3 )

# ======================================================
# how to link  library
# approach 1
FIND_LIBRARY(DB_CXX                             # return absolute path of lib, in DB_CXX variable
    NAMES  db_cxx                               # -l
    PATHS  /usr/local/BerkeleyDB.6.1/lib)       # -L

IF(DB_CXX)  # note: ${}
    # not  target_link_library, use plural
    TARGET_LINK_LIBRARIES(create-index ${DB_CXX})   # -l
ENDIF()


# ======================================================

# approach 2
#LINK_DIRECTORIES(/usr/local/BerkeleyDB.6.1/lib/)    # note: link_directories 必须在add_executable 之前调用.官方文档这么说的.
                                                     # LINK_DIRECTORIES 只对之后的add_executable()target有效.
#TARGET_LINK_LIBRARIES(create-index  db_cxx)         # 如果使用了link_directories, 那么这里使用库的相对路径, 相对于link_directories
# ======================================================
