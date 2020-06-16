# vim:set foldmethod=marker  foldlevel=0: vim modeline

# dia export
diae()
{
    # {{{
    UsageMsg="dia   <dia_file>  [export_type/png]"
    # if 可以直接判断命令执行结果
    if ! ParaUsage "${UsageMsg}" 1 $* ; then
        return -1
    fi

    DEFAULT_TYPE="jpg"

    # if [ -z "$2" ]; then
    #     EX_F=${1%.dia}.$DEFAULT_TYPE
    # else
    #     EX_F=${1%.dia}.$2
    # fi

    for i in $@
    do
        DIA_F=$i
        EX_F=${DIA_F%.dia}.$DEFAULT_TYPE

        echo "export ------>" $EX_F
        dia $DIA_F -e $EX_F
    done


    return
    # }}}
}
