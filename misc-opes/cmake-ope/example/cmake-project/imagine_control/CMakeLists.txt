cmake_minimum_required(VERSION 2.8  FATAL_ERROR)

# ============ compile definition ========

set(DEBUG  -g)
add_definitions(${DEBUG} -std=c++11 -Wall  -O0)      # compile flags

# ============ find-so-lib and link_directories =================

# link_directories 必须放在 add_executable之前
link_directories( $ENV{CHARLENE_HOME}/lib       )   # 相当于添加 -L
link_directories( /opt/oracle/11.2/client64/lib )
link_directories( /usr/local/BerkeleyDB.6.1/lib )

# ============ executable ===============

set(Imagine_controlSrc imagine_control.cpp
                      imagine_control_main.cpp)

add_executable(Imagine_control  ${Imagine_controlSrc})

target_link_libraries(Imagine_control glog          # ${GLOG}
                                      db_cxx        # berkeley lib
                                      MyProC
                                      cxx_mts_db.so    # Galaxy_MTS_Berkeley + Galaxy_MTS_Oracle
                                      mtsnode
                                      imagine.so    # 这里加不加so都可以, 但是如果不加会有歧义:
                                                    # 因为imagine既可以指一个target, 也可以指一个库
                                                    # 所以加一个.so, 明确指明依赖的是一个so
                                      clntsh)

# ============ install ===============

install(TARGETS  Imagine_control
        RUNTIME  DESTINATION $ENV{CHARLENE_HOME}/bin)
