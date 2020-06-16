

add_library(hello SHARED  hello.cpp)
set_target_properties(hello PROPERTIES VERSION 1.2 SOVERSION 1)

add_library(hello_static STATIC  hello.cpp)
set_target_properties(hello_static PROPERTIES OUTPUT_NAME "hello")

install(TARGETS  hello hello_static
        LIBRARY DESTINATION  lib
        ARCHIVE DESTINATION  lib
        )

install (FILES  hello.hpp  DESTINATION  include)
