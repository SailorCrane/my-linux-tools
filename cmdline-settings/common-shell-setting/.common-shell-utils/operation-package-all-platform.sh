# vim:set foldmethod=marker  foldlevel=0: vim modeline

# =================== alias  =====================
alias ins=install
alias se=search

# =================== function  =====================
install() {
    if is_ubuntu; then
        apt_install $@
        return
    fi

    if is_redhat; then
        yum_install $@
    fi

    if is_mac; then
        brew cask install $@ || brew install $@
    fi
}

uninstall() {
    if is_ubuntu; then
        apt_uninstall $@
        return
    fi

    if is_redhat; then
        yum_uninstall $@
        return
    fi

    if is_mac; then
        brew uninstall $@
        return
    fi
}

list_all_packages() {
    # 1. list all the packages
    if is_ubuntu; then
        dpkg -l
        return
    fi

    if is_redhat; then
        rpm -qa
    fi

    if is_mac; then
        brew list
    fi
}

list_specific_package_files() {
    # 2. list the specific package all files
    if is_ubuntu; then
        dpkg -L $*
        return
    fi

    if is_redhat; then
        rpm -ql $*
    fi

    if is_mac; then
        brew list $*
    fi
}

list() {
    # echo $#
    if [ $# -eq 0 ]; then       # -ge stand for : greator or equal
        list_all_packages
    else
        list_specific_package_files $*
    fi
}

search() {
    if is_ubuntu; then
        apt_search $@
        return
    fi

    if is_redhat; then
        yum_search $@
        return
    fi

    if is_mac; then
        brew search $@
        return
    fi
}

depends() {
    if is_ubuntu; then
        apt_depends $@
        return
    fi

    if is_redhat; then
        yum_depends $@
        return
    fi
}

# 反向依赖: 谁依赖自己
rdepends() {
    if is_ubuntu; then
        apt_rdepends $@
        return
    fi

    if is_redhat; then
        yum_rdepends $@
        return
    fi
}


# the specific file is from which package?
filep() {
    UsageMsg="filep <cmd | absolute_file_path>"

    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    # 获取绝对路径
    local abs_path_of_cmd=$(abs_path_of_file $1)
    if ! is_absolute_path $abs_path_of_cmd; then
        echo "$1 is not in \$PATH"
        return -1
    fi

    if is_ubuntu; then
        apt_filep $abs_path_of_cmd
        return
    fi

    if is_redhat; then
        yum_filep $abs_path_of_cmd
        return
    fi

    # if is_mac; then
    #     brew search $@
    #     return
    # fi

    echo "Don't support this operation for this platform"
}
