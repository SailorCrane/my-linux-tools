
add_executable(hello main.cpp)
set(EXECUTABLE_OUTPUT_PATH  ${PROJECT_BINARY_DIR}/bin)

install(TARGETS  hello
        RUNTIME DESTINATION bin)
