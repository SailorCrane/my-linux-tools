cmake_minimum_required(VERSION 2.8  FATAL_ERROR)

set(DEBUG  -g)
add_definitions(${DEBUG} -std=c++11 -Wall  -O0)      # compile flags approach 1

aux_source_directory(../Record/  UsedRecord)


set(UsedBerkeley   ../Galaxy_MTS_Berkeley.cpp
                   ../Galaxy_MTS_Berkeley_CallBack.cpp
                   ../BerkeleyBase.cpp
                   ../BdbUtils.cpp )

set(UsedCounter  ../Counter.cpp
                 ../ExactCounter.cpp
                 ../AnyTypeCounter.cpp)

set(UsedOracle   ../Relation2Sql.cpp
                 ../Operator2Sql.cpp
                 ../Galaxy_MTS_Oracle.cpp
                 ${UsedCounter} )    # UsedOracle 依赖于UsedCounter

# ============find-so-lib=================

find_library(DB_CXX                                     # return absolute path of lib, in DB_CXX variable
            NAMES  db_cxx                               # -l
            PATHS  /usr/local/BerkeleyDB.6.1/lib)       # -L
            #PATHS  /usr/locl/BerkeleyDB.6.1/lib)       # -L

find_library(GLOG                             # return absolute path of lib, in DB_CXX variable
            NAMES  glog                               # -l
            PATHS  /usr/local/lib/)           # -L

find_library(MYPROC
            NAMES  MyProC
            #PATHS  /mysoftware/charlene/lib)
            PATHS  $ENV{CHARLENE_HOME}/lib)

# =============object-library=================

# need compile only once to speed up, so used object-library
add_library(RecordObj    OBJECT  ${UsedRecord})
add_library(BerkeleyObj  OBJECT  ${UsedBerkeley})
add_library(OracleObj    OBJECT  ${UsedOracle})

# object lib used by shared-obj must set -fPIC  compile flags !!!
set_target_properties (RecordObj   PROPERTIES COMPILE_FLAGS "-fPIC")
set_target_properties (BerkeleyObj PROPERTIES COMPILE_FLAGS "-fPIC")
set_target_properties (OracleObj   PROPERTIES COMPILE_FLAGS "-fPIC")

# ============.so lib====================

# can use: "make default" to compile cxx_mts_db
add_custom_target (default DEPENDS cxx_mts_db)      # add default target

add_library (cxx_mts_db         SHARED $<TARGET_OBJECTS:BerkeleyObj> $<TARGET_OBJECTS:OracleObj>   $<TARGET_OBJECTS:RecordObj>  )

target_link_libraries(cxx_mts_db ${MYPROC}  ${DB_CXX} )      # 可以一次为target指定多个链接库
set_target_properties(cxx_mts_db  PROPERTIES VERSION 1.2 SOVERSION 1)        # VERSION 和 SOVERSION必须大写

# ============.a lib=========================

#add_library (cxx_mts_db_static        STATIC ${UsedBerkeley} ${UsedOracle} ${UsedRecord})
add_library (cxx_mts_db_static  STATIC $<TARGET_OBJECTS:BerkeleyObj> $<TARGET_OBJECTS:OracleObj>   $<TARGET_OBJECTS:RecordObj>  )

set_target_properties (cxx_mts_db_static PROPERTIES OUTPUT_NAME "cxx_mts_db")

# ============Berkeley-unit-test==================

set(BerkeleyTargetUsed  $<TARGET_OBJECTS:RecordObj>
                        $<TARGET_OBJECTS:BerkeleyObj>)

set(BerkeleyTarget  test-mts-insert-berkeley
                    test-mts-getFirstId-berkeley
                    test-mts-insert-berkeley-diffLinked
                    test-mts-delete-berkeley
                    test-mts-update-berkeley
                    test-mts-getLinkedId-berkeley
                    test-mts-getSiblingId-berkeley
                    test-mts-getCount-berkeley
                    test-mts-inquiry
                    test-mts-insert-berkeleyPerfor
                    test-mts-getOrigin-berkeley
                    test-mts-get53-berkeley
                    test-mts-delete-53env
                    test-mts-insertReference-berkeley
                    test-mts-getReference-berkeley
                    test-mts-insert-logicLog
                    test-mts-get-logicLog
                    test-mts-insert53-berkeley
                    test-mts-getRobotId-berkeley)

# 测试so是否可链接.
add_executable(test-mts-insert-berkeley-so test-mts-insert-berkeley.cpp)     # 可以使用"" 将变量和字符串连接起来
target_link_libraries(test-mts-insert-berkeley-so ${DB_CXX} ${GLOG} cxx_mts_db)      # 可以一次为target指定多个链接库

foreach(berTarget ${BerkeleyTarget})
    add_executable( ${berTarget}  "${berTarget}.cpp"  ${BerkeleyTargetUsed} )     # 可以使用"" 将变量和字符串连接起来
    target_link_libraries(${berTarget} ${DB_CXX} ${GLOG})      # 可以一次为target指定多个链接库
endforeach()

# ============Berkeley-test-use-static-lib==================

#add_executable(test-mts-insert-berkeley-static
                    #test-mts-insert-berkeley.cpp
                    #)
#target_link_libraries(test-mts-insert-berkeley-static cxx_mts_db_static  ${DB_CXX}  ${GLOG})

# ==============Oracle-unit-test==================

set(OracleTargetUsed  $<TARGET_OBJECTS:RecordObj> $<TARGET_OBJECTS:OracleObj>)

set(OracleTarget     test-mts-insert-oracle
                     test-mts-update-oracle
                     test-mts-delete-oracle
                     test-mts-select-byMType-oracle
                     test-mts-getCount-oracle
                     test-mts-getFirstId-oracle
                     test-mts-getLinkedId-oracle
                     test-mts-getSiblingId-oracle
                     test-mts-getAll-sibling-oracle
                     test-mts-getRobotId-oracle )

set(OperatorTarget  test-mts-insert-operator
                    test-mts-select-operator
                    test-mts-select-operator-byElements
                    test-mts-delete-operator
                    test-mts-update-operator )

foreach(orlTarget ${OracleTarget} ${OperatorTarget})
    add_executable( ${orlTarget}  "${orlTarget}.cpp"  ${OracleTargetUsed} )     # 可以使用"" 将变量和字符串连接起来
    target_link_libraries(${orlTarget} ${MYPROC}  ${DB_CXX} ${GLOG})      # 可以一次为target指定多个链接库
endforeach()

install(TARGETS  cxx_mts_db
        LIBRARY  DESTINATION $ENV{CHARLENE_HOME}/lib
        ARCHIVE  DESTINATION $ENV{CHARLENE_HOME}/lib)

# ==============oracle2bdb-53: test==================

add_executable(oracle2bdb-53  "oracle2bdb-53.cpp"  ${OracleTargetUsed} ${BerkeleyTargetUsed})
target_link_libraries(oracle2bdb-53 ${MYPROC}  ${DB_CXX} ${GLOG})      # 可以一次为target指定多个链接库
