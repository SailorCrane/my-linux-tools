# vim: set filetype=cmake : vim modeline( set )

# ======================================================

aux_source_directory(.  MAINSRCS)
#set(MAINSRCS  main.cpp  fun.cpp)

add_executable(main  ${MAINSRCS})
add_custom_target(run
                  COMMAND main)

# ======================================================

set_target_properties(main  PROPERTIES COMPILE_FLAGS "-std=c++11 -g")

install(TARGETS   main
        RUNTIME   DESTINATION   bin)

# ======================================================

set(CMAKE_MODULE_PATH ../)
find_package(HELLO QUIET REQUIRED)
#find_package(HELLO )
#message("found " ${HELLO_FOUND})

include_directories( ${HELLO_INCLUDE_DIR} )
target_link_libraries(main  ${HELLO_LIBRARY})

# ======================================================
