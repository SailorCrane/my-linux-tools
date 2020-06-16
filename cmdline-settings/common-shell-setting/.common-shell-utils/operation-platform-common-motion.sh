# vim:set foldmethod=marker  foldlevel=0: vim modeline

# =================== alias  =====================
alias ins=install
alias se=search

# =================== function  =====================
install() {
    # if is_ubuntu; then
    if is_ubuntu; then
        apt_install $@
        return
    fi

    #if is_redhat; then
    if is_redhat; then
        yum_install $@
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

search() {
    if is_ubuntu; then
        apt_search $@
        return
    fi

    if is_redhat; then
        yum_search $@
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
