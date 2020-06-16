# vim:set foldmethod=marker  foldlevel=0: vim modeline

# search, install, uninstall, depends, rdepends software
# {{{

function yum_search {     # search: dont need root
    yum search $@
}

function yum_install {    # install need root
    sudo yum install $@ -y
}

function yum_uninstall {
    sudo yum remove $@ -y
}

function yum_depends {     # search: dont need root
    :
}

function yum_rdepends {     # search: dont need root
    :
}
# }}}
