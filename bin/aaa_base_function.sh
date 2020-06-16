
# 这个文件是个基础函数提供文件, 不单独执行.

platform() {
    ## 通过ID_LIKE 判断系统类型
    local RELEASE_FILE="/etc/os-release"
    LIKE_INFO=$(env grep 'ID_LIKE' ${RELEASE_FILE})

    if echo $LIKE_INFO | env grep -i 'rhel' > /dev/null 2>/dev/null; then
        echo 'redhat'
        return
    fi

    # mint的ID_LIKE是ubuntu, ubuntu的ID_LIKE是debian
    if echo $LIKE_INFO | env grep -E -i '(ubuntu)|(debian)' > /dev/null 2>/dev/null ; then
        echo 'ubuntu'
        return
    fi

    echo $LIKE_INFO
}



# =================== is-platform check functions =====================
# homebrew
is_mac() {
    return -1
}

# apt-get
is_ubuntu() {
    plat=$(platform)
    if [[ ubuntu == ${plat} ]]; then
        return 0
    else
        return -1
    fi
}

# yum
is_redhat() {
    plat=$(platform)
    if [[ redhat == ${plat} ]]; then
        return 0
    else
        return -1
    fi
}

