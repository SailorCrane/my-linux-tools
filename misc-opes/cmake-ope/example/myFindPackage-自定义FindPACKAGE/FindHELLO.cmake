
find_path(HELLO_INCLUDE_DIR  Hello.h   /home/crane/test/cmake/helloLib/build/usr/include/)
find_library(HELLO_LIBRARY  hello   /home/crane/test/cmake/helloLib/build/usr/lib/)

if (HELLO_INCLUDE_DIR AND HELLO_LIBRARY)
    set(HELLO_FOUND TRUE)
endif (HELLO_INCLUDE_DIR AND HELLO_LIBRARY)

# quiet and required
if (HELLO_FOUND)
    if (NOT HELLO_FIND_QUIETLY)
        message(STATUS "Found Hello: ${HELLO_LIBRARY} ${HELLO_INCLUDE_DIR}")
    endif (NOT HELLO_FIND_QUIETLY)
else (HELLO_FOUND)
    if (HELLO_FIND_REQUIRED)
        message(FATAL_ERROR "Could not find hello library")
    endif (HELLO_FIND_REQUIRED)
endif (HELLO_FOUND)
