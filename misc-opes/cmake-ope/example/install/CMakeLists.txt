
cmake_minimum_required(VERSION 3.5)

# cd build ;
# cmake .. -DCMAKE_INSTALL_PREFIX=./usr         # 否则cmake默认安装到/usr/local
# mk; mk install

project(HELLO)
add_subdirectory(src  src-bin)

message("project binary "  ${PROJECT_BINARY_DIR} )

install(FILES COPYRIGHT README  DESTINATION share/doc/cmake/t2)
install(PROGRAMS runhello.sh    DESTINATION bin)            # programs指定的话, 程序会有可执行权限(应该是这样的)
install(DIRECTORY doc/  DESTINATION  share/doc/cmake/t2)
