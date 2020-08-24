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
}

list() {
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
