
link_directories(/home/crane/test/cmake/t3-shared-generate/build/loc/lib/)

add_executable(helloMain  main.cpp)
set(CMAKE_INCLUDE_DIRECTORIES_AFTER on)

include_directories(/home/crane/test/cmake/t3-shared-generate/build/loc/include)


#target_link_libraries(helloMain  hello.so)     # target_link_libraries 可以决定使用静态库, 还是动态库
                                                # hello/libhello.so/hello.so    三种写法都可以
target_link_libraries(helloMain  hello.so)       # 使用静态库: hello.a/libhello.a    两种写法都可以

#message("install prefix is ${CMAKE_INSTALL_PREFIX}")

install(TARGETS  helloMain
        RUNTIME DESTINATION  bin)

# 链接方法2
#find_library(HelloLib
            #NAMES  hello
            #PATHS  /home/crane/test/cmake/t3-shared-generate/build/loc/lib/)
#target_link_libraries(helloMain  ${HelloLib})

#install(TARGETS)
