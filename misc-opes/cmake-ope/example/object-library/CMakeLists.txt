cmake_minimum_required(VERSION 2.8  FATAL_ERROR)

set(DEBUG  -g)
add_definitions(${DEBUG} -std=c++11 -Wall  -O0)      # compile flags approach 1

aux_source_directory(../Record/  UsedRecord)
#message( ${UsedRecord} )

#file(GLOB TestRecord "../Record/test*.cpp")
#message("glob"  ${TestRecord})

#list(REMOVE_ITEM UsedRecord ${TestRecord})
#message( ${UsedRecord} )
#file(../Record/  UsedRecord)
#file(GLOB UsedRecord "../Record/*cpp" EXCLUDE "../Record/test*.cpp")
#message( ${UsedRecord} )

#list(REMOVE_ITEM  ${UsedRecord} "../Record/test*.cpp")
#message( ${UsedRecord} )

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
                    ${UsedCounter} )

find_library(DB_CXX                                     # return absolute path of lib, in DB_CXX variable
            NAMES  db_cxx                               # -l
            PATHS  /usr/local/BerkeleyDB.6.1/lib)       # -L

find_library(GLOG                             # return absolute path of lib, in DB_CXX variable
            NAMES  glog                               # -l
            PATHS  /usr/local/lib/)           # -L

find_library(MYPROC
            NAMES  MyProC
            PATHS  /mysoftware/charlene/lib)

# ============object-library=================

# compile only once, so used object-library
add_library(RecordObj    OBJECT  ${UsedRecord})
add_library(BerkeleyObj  OBJECT  ${UsedBerkeley})
add_library(OracleObj    OBJECT  ${UsedOracle})

# object lib used by shared-obj must set -fPIC  compile flags !!!
set_target_properties (RecordObj   PROPERTIES COMPILE_FLAGS "-fPIC")
set_target_properties (BerkeleyObj PROPERTIES COMPILE_FLAGS "-fPIC")
set_target_properties (OracleObj   PROPERTIES COMPILE_FLAGS "-fPIC")

# ============.so lib====================

#add_library (cxx_mtx_db        SHARED ${UsedBerkeley} ${UsedOracle} ${UsedRecord})
add_library (cxx_mtx_db         SHARED $<TARGET_OBJECTS:BerkeleyObj> $<TARGET_OBJECTS:OracleObj>   $<TARGET_OBJECTS:RecordObj>  )

#set_target_properties(cxx_mtx_db         PROPERTIES VERSION 1.2 SOVERSION 1)        # VERSION 和 SOVERSION必须大写
#set_target_properties (cxx_mtx_db PROPERTIES COMPILE_FLAGS "-fPIC")
#set_target_properties(cxx_mtx_db PROPERTIES)

# ============.a lib=========================

#add_library (cxx_mtx_db_static        STATIC ${UsedBerkeley} ${UsedOracle} ${UsedRecord})
add_library (cxx_mtx_db_static  STATIC $<TARGET_OBJECTS:BerkeleyObj> $<TARGET_OBJECTS:OracleObj>   $<TARGET_OBJECTS:RecordObj>  )

set_target_properties (cxx_mtx_db_static PROPERTIES OUTPUT_NAME "cxx_mtx_db")

# ============Berkeley-unit-test==================

add_executable(test-mts-insert-berkeley
                    test-mts-insert-berkeley.cpp
                    $<TARGET_OBJECTS:RecordObj>
                    $<TARGET_OBJECTS:BerkeleyObj>
                    )

target_link_libraries(test-mts-insert-berkeley  ${DB_CXX} ${GLOG})  # linked all libraries


# ============Berkeley-test-use-static-lib==================

#add_executable(test-mts-insert-berkeley-static
                    #test-mts-insert-berkeley.cpp
                    #)
#target_link_libraries(test-mts-insert-berkeley-static cxx_mtx_db_static  ${DB_CXX}  ${GLOG})

# ==============Oracle-test==================

add_executable(test-mts-insert-oracle
                    test-mts-insert-oracle.cpp
                    $<TARGET_OBJECTS:RecordObj>
                    $<TARGET_OBJECTS:OracleObj>
                    )

target_link_libraries(test-mts-insert-oracle  cxx_mtx_db ${MYPROC} ${DB_CXX})      # 可以一次为target指定多个链接库
#target_link_libraries(test-mts-insert-oracle  ${GLOG})
