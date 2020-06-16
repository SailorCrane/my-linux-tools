cmake_minimum_required(VERSION 2.8  FATAL_ERROR)

# ============ compile definition ========

set(DEBUG  -g)
add_definitions(${DEBUG} -std=c++11 -Wall  -O0)      # compile flags

# ============ find-so-lib and link_directories =================

# link_directories 必须放在 add_executable之前
link_directories( /opt/oracle/11.2/client64/lib )
link_directories( /usr/local/BerkeleyDB.6.1/lib )
link_directories( $ENV{CHARLENE_HOME}/lib       )   # 相当于添加 -L

# ============ executable ===============

set(imagine_logicSrc  imagine_logic.cpp)

add_library( imagine_logic  SHARED  ${imagine_logicSrc} )

target_link_libraries(imagine_logic   glog          # ${GLOG}
                                      db_cxx        # berkeley lib
                                      MyProC
                                      cxx_mts_db.so    # Galaxy_MTS_Berkeley + Galaxy_MTS_Oracle
                                      mtsnode
                                      imagine.so
                                      clntsh)

# ============ install ===============

install(TARGETS  imagine_logic
        RUNTIME  DESTINATION $ENV{CHARLENE_HOME}/bin
        LIBRARY  DESTINATION $ENV{CHARLENE_HOME}/lib
        ARCHIVE  DESTINATION $ENV{CHARLENE_HOME}/lib)
