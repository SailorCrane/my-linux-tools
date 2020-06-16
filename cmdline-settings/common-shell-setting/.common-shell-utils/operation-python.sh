# vim:set foldmethod=marker  foldlevel=0: vim modeline

pyimport_base()
{
# {{{
    UsageMsg="pyimport/pyimport2/pyimport3 <modules>"
    if ! ParaUsage "${UsageMsg}" 2 $* ; then
        return -1
    fi

    py="$1"     # 可能会用到 python, python2, python3
    shift

    for i in $*; do
        #echo $i
        if ! $py -c "import $i" >/dev/null 2>&1; then
            echo -n "invalid module name "
            failureMsg "$i"     # highlight module name
        fi
    done
# }}}
}

alias pyimport="pyimport_base python"
alias pyimport2="pyimport_base python2"
alias pyimport3="pyimport_base python3"


# py ui compile + export
pyuie_base()
{
# {{{
    UsageMsg="pyuie4/pyuie5 <ui_file>"
    if ! ParaUsage "${UsageMsg}" 2 $* ; then
        return -1
    fi

    pyuic="$1"     # 可能会用到 python, python2, python3
    shift

    FILE=$1
    EXPO=${1%.ui}.py
    $pyuic $FILE -o $EXPO
# }}}
}
alias pyuie="pyuie_base pyuic5"
alias pyuie4="pyuie_base pyuic4"
alias pyuie5="pyuie_base pyuic5"

# py rc compile + export
pyrce_base()
{
# {{{
    UsageMsg="pyrce4/pyrce5 <rc_file>"
    if ! ParaUsage "${UsageMsg}" 2 $* ; then
        return -1
    fi

    pyrcc="$1"     # 可能会用到 python, python2, python3
    shift

    FILE=$1
    EXPO=${1%.qrc}.py
    $pyrcc $FILE -o $EXPO
# }}}
}
alias pyrce="pyrce_base pyrcc5"
alias pyrce4="pyrce_base pyrcc4"
alias pyrce5="pyrce_base pyrcc5"
