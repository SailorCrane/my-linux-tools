# vim: set filetype=cmake  : vim modeline( set )
cmake_minimum_required (VERSION 2.8)

project(export)

add_definitions('-g')
add_definitions('-Wall')
#add_definitions('-std=c++11')

# ============find-so-lib=================

include_directories(
                      )

link_directories(
                   )

# ============ target =================

set(EXEC main)
set(DYNA_LIB add)

add_executable(${EXEC}  ${EXEC}.c)
add_library(${DYNA_LIB}  SHARED ${DYNA_LIB}.c)

target_link_libraries(${EXEC}
                      ${DYNA_LIB}
                            )


set_target_properties(${DYNA_LIB} PROPERTIES COMPILE_FLAGS "-fPIC") # compile
set_target_properties(${DYNA_LIB} PROPERTIES
                       LINK_FLAGS "-Wl,--version-script=${CMAKE_SOURCE_DIR}/export.version") # LINK_FLAGS

#set_target_properties(${DYNA_LIB} PROPERTIES COMPILE_FLAGS "-fPIC -fvisibility=hidden")    # need -fPIC!!!
#set_directory_properties(PROPERTIES ADDITIONAL_MAKE_CLEAN_FILES ${CMAKE_SOURCE_DIR}/${PROJECT_NAME})
