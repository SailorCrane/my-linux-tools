# vim:set foldmethod=marker  foldlevel=0: vim modeline

# search, install, uninstall, depends, rdepends software
# {{{

yum_search() {     # search: dont need root
    yum search $@
}

yum_install() {    # install need root
    sudo yum install $@ -y
}

yum_uninstall() {
    sudo yum remove $@ -y
}

# 自己依赖谁?
yum_depends() {
    # yum -q deplist $1
    rpm -q --requires $1
}

# 谁依赖自己?
yum_rdepends() {
    rpm -q --whatrequires $1
}

yum_filep() {
    local _file=$1

    rpm -qf $_file
}

# }}}
