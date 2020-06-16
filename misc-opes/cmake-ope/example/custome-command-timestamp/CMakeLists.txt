cmake_minimum_required(VERSION 2.8)

set(fromFile  ${CMAKE_CURRENT_SOURCE_DIR}/src.txt)
set(toFile    ${CMAKE_CURRENT_SOURCE_DIR}/src.cpp)

set(CpCmd cp -f  ${fromFile} ${toFile})

#add_custom_command(
    #OUTPUT
        #${toFile}
    #DEPENDS
        #${fromFile}
    #COMMAND
        #cp  ${fromFile}  ${toFile}
    #COMMENT
        #"Generating API documentation with Doxygen"
    ##VERBATIM
    #)

add_custom_command(
    OUTPUT
        ${toFile}
    DEPENDS             # 一定要有, 否则时间戳没用: 只要保证 add_custom_target 的target 依赖 add_custom_command的OUTPUT即可
        "${fromFile}"

    COMMAND
        ${CpCmd}                # CpCmd是否"真正执行", 会根据cmd生成文件时间戳 和 源文件时间戳进行
    WORKING_DIRECTORY
        "${CMAKE_CURRENT_SOURCE_DIR}"
    COMMENT
        "generate cpp file"
    )

#add_custom_target(mycus ALL DEPENDS ${toFile})        # 如果有ALL, 那么编译默认目标(即 make时)都会执行
                                                      # 这里 DEPENDS ${toFile}, 被add_custom_command, 所以会执行add_custom_command

add_executable(main ${toFile})


# 注意: 即使什么目标也没有, 也会有一个默认目标(虽然什么都不做)
# 但是默认make 时, 会执行 设置了 ALL 选项的 add_custom_target
