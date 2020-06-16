# vim:set foldmethod=marker  foldlevel=0: vim modeline

# guake_count()
# {
# }

GUAKE_BACKUP_FILE="$HOME/.guake-session"

write_file_key_value()
{
#{{{
    # key, value
    key=$1
    value=$2
    echo "$key:$value" >> $GUAKE_BACKUP_FILE
#}}}
}

read_file_key_value()
{
#{{{
    key=$1
    env grep $key $GUAKE_BACKUP_FILE | cut -d ":" -f2-
#}}}
}

guake_save()
{
    # {{{
    MAX_TAB=20

    # 0: 备份 GUAKE_BACKUP_FILE + 并清空
    # 防止使用mv alias(mv -i)
    env mv -f $GUAKE_BACKUP_FILE ${GUAKE_BACKUP_FILE}_old >/dev/null 2>&1
    echo -n "" > $GUAKE_BACKUP_FILE

    # 1 保存当前索引
    cur_idx=$(guake -g)
    write_file_key_value cur_idx $cur_idx

    # 2: 遍历 从0开始, 直到出错
    #for i in {0..$MAX_TAB}; do     # NOTE: bash不支持 {{range}}中使用变量
    for ((i=0;i<=20;i++)); do       # 支持  zsh + bash

        # 跳转到guake tab
        # guake3.0之后, invalid输出到了stderr
        if guake -s $i 2>&1 | env grep invalid >>/dev/null; then
            break
        fi

        label=$(guake -l)
        #write_file_key_value tab "$i:$label"
        write_file_key_value tab "$label"
    done

    # 3: 跳转回当前索引( 直接读取$cur_idx即可, 不用保存)
    guake -s $cur_idx
    # }}}
}

guake_restore()
{
#{{{
    # 判断是否guake tab多余两个, 如果多于两个: 询问用户是否继续恢复?

    # 读取save 遍历: 按照idx, 读取name
    #for i in $(guake_show_backup | env grep "tab"| cut -d ":" -f2-); do echo $i ; done
    #TABS=$(guake_show_backup | env grep "^tab:"| cut -d ":" -f2-)

    #echo -e $TABS
    # 2:创建 tab
    # for tab in $TABS; do
    # IFS="\n"                      # NOTE 会导致bash解析出错
    #for tab in $(echo $TABS); do
    #for tab in "$TABS"; do

    # 行读取支持zsh + bash
    # 只有使用 while read -r, 才能读取一行, 使用for循环做不到
    guake_show_backup | env grep "^tab:"| cut -d ":" -f2- | while read -r tab; do
        echo "tab:===="$tab
        guake -n $HOME                 # create
        guake -r "$tab"                # rename: 这里要加上数字用于alt跳转
        if ! [ "$tab" = 'Terminal' ]; then
            # echo 'No Default Terminal'
            # 如果不是默认Terminal: 即带名字, 那么使用name恢复相应tmux session
            TMUX_SESSION=$(echo $tab | cut -d ' ' -f2- )
            #echo $TMUX_SESSION
            guake -e "tmux attach -t $TMUX_SESSION" # try attach tmux(guake和tmux名字要相同, 或者是tmux名字的子串)
        fi

    done
#}}}
}

guake_show_backup()
{
    cat $GUAKE_BACKUP_FILE
}


# =================== alias  =====================
alias gsave=guake_save
alias gshow=guake_show_backup

alias gres=guake_restore
alias grest=guake_restore
