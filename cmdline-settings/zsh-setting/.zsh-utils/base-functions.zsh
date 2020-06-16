# vim: set fdm=marker  fdl=0: vim modeline( set )

islogin() {
#{{{
    if [[ -o login ]]; then
        echo yes
    else
        echo no
    fi
#}}}
}

isinter() {
#{{{
    if [[ -o interactive ]]; then
        echo yes
    else
        echo no
    fi
#}}}
}

is_rcs() {
    # RCS option means: after run /etc/zshenv, if or not to run ~/.zshenv, /etc/.zprofile, .zprofile, /etc/zshrc, .zshrc, login, logout
    # rcs stand for : rc startup
    [[ -o RCS ]]
}

is_global_rcs() {
    # RCS option means: after run /etc/zshenv, if or not to run ~/.zshenv, /etc/.zprofile, .zprofile, /etc/zshrc, .zshrc, login, logout
    [[ -o GLOBAL_RCS ]]
}
