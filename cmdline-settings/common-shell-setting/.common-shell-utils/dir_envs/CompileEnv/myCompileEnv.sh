# 记录着所使用库的头文件路径变量, 这样编译时, 可以不用-I 选项
# 注意变量必须export, 才能被gcc/g++ 子进程接收到
# export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/local/BerkeleyDB.6.1/include/
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/home/crane/test/berkeleydb/include
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/home/crane/test/berkeleydb/lib


# CHARLEN HOME, lib, header
export CHARLENE_HOME=${mysoftware}/charlene

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${CHARLENE_HOME}/lib
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:${CHARLENE_HOME}/include
