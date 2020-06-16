cmake_minimum_required(VERSION 2.8  FATAL_ERROR)

#set(DEBUG  -g)
#add_definitions(${DEBUG} -std=c++11 -Wall  -O0)      # compile flags approach 1

set(NoDbAccessTest true )   # 不要编译 DbAccess 单元测试

add_subdirectory( ./DbAccess/test     )     # 被所有模块依赖
add_subdirectory( ./imagine_interface )     # 被所有模块依赖: 除了DbAccess的cxx_mts_db
add_subdirectory( ./imagine_logic     )     # 生成库
add_subdirectory( ./imagine_control   )

