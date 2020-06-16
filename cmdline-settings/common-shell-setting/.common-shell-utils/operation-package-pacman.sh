# vim:set foldmethod=marker  foldlevel=0: vim modeline

# search, install, uninstall, depends, rdepends software
# {{{

function pacman_search {     # search: dont need root
    pacman -Ss $@
}

function pacman_install {    # install need root
    sudo pacman -Sy $@ --noconfirm
}

function pacman_uninstall {
    :
}

function pacman_depends {     # search: dont need root
    :
}

function pacman_rdepends {     # search: dont need root
    :
}
# }}}
