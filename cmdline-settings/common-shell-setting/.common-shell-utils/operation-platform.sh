# vim:set foldmethod=marker  foldlevel=0: vim modeline

platform() {
    #local issue_file="/etc/issue"      # deprecated
    local RELEASE_FILE="/etc/os-release"

    if env grep 'ID_LIKE' ${RELEASE_FILE} >/dev/null ; then
        # 存在ID_LIKE
        LIKE_INFO=$(env grep 'ID_LIKE' ${RELEASE_FILE})

        if echo $LIKE_INFO | env grep 'rhel' > /dev/null 2>/dev/null; then
            echo 'redhat'
            return
        fi

        if echo $LIKE_INFO | env grep -i 'ubuntu' > /dev/null 2>/dev/null ; then
            echo 'ubuntu'
            return
        fi

        # 如果是debina, 返回ubuntu
        if echo $LIKE_INFO | env grep -i 'debian' > /dev/null 2>/dev/null ; then
            echo 'ubuntu'
            return
        fi

        echo "ID_LIKE: [$LIKE_INFO] do not recognise"

    else
        # 不存在ID_LIKE, 直接输出ID: 例如arch, gentoo
        env grep '^ID=' $RELEASE_FILE | awk -F "="  '{print $2}'
    fi
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
        # HINT: mint返回ubuntu
        return 0
    elif [[ debian == ${plat} ]]; then
        # HINT: ubuntu返回debian
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

# pacman
is_arch() {
    return -1
}
