# vim:set foldmethod=marker  foldlevel=0: vim modeline

# Save and restore the state of tmux sessions and windows.
# TODO: persist and restore the state & position of panes.

# 这个github项目中, 有很多好东西.
# github链接获取：https://github.com/mislav/dotfiles/blob/d2af5900fce38238d1202aa43e7332b20add6205/bin/tmux-session

# set -e        # 如果脚本返回非0, 立即退出

# ================= save and restore tmux session ==============

dump() {
    local d=$'\t'
    tmux list-windows -a -F "#S${d}#W${d}#{pane_current_path}"
}

save() {
    dump > ~/.tmux-session
}

terminal_size() {
    stty size 2>/dev/null | awk '{ printf "-x%d -y%d", $2, $1 }'
}

session_exists() {
    tmux has-session -t "$1" 2>/dev/null
}

add_window() {
    tmux new-window -d -t "$1:" -n "$2" -c "$3"     # -c specify  window current dir
}

# new_session "$session_name" "$window_name" "$dir" "$dimensions"
# -d detach  new-session: dont attach current terminal with tmux
# -n window-name( n name )
new_session() {
    cd "$3" &&
        # tmux new-session -d -s "$1" -n "$2" $4        # $4 stand for size, zsh dont support
        tmux new-session -d -s "$1" -n "$2"     # no size msg
}

restore() {
    tmux start-server
    local count=0
    local dimensions="$(terminal_size)"

    while IFS=$'\t' read session_name window_name dir; do
        if [[ -d "$dir" && $window_name != "log" && $window_name != "man" ]]; then
            if session_exists "$session_name"; then
                add_window "$session_name" "$window_name" "$dir"
            else
                new_session "$session_name" "$window_name" "$dir" "$dimensions"
                count=$(( count + 1 ))
            fi
        fi
    done < ~/.tmux-session

    echo "restored $count sessions"
}
alias rest=restore


# encap save, restore
# tmux-do restore/save
function tmux-do {
    # {{{
    case "$1" in
        save | restore )
            $1                # 调用 $1 这个函数( save/restore 函数都在本文件中 )
            ;;
        * )                   # 其它参数, 都是invalid
            echo "valid commands: save, restore" >&2
            exit 1
    esac
    # }}}
}

# =================== tmux operation encapsulation =======================


# tmc/tmcreate
# 创建tmux session, 并且修改terminal tab的title
# 依赖于 set-title, 所以必须定义在set-title之后
# 因为guake 设置F2为 set titile, 所以没有必要在tmc中设置title
#function tmcreate {
    ## {{{
    ## Usage: 有没有办法写一个专门的usage通用函数啊, 不然没有函数中都有usage. 见函数ParaUsage
    #if [  $# != 1  ]
    #then
        #echo "Usage:  tmcreate  <sessionName>"
        #echo "Usage:  tmc       <sessionName>"
        #return
    #fi

    #SessionName=$1

    ## 设置terminal tab名字
    #set-title  $SessionName

    ## 创建session
    #tmux new -s  $SessionName
    ## }}}
#}
#alias  tmc=tmcreate

tmrename() {
    # {{{
    UsageMsg='tmrename  <oldName> <newName>\nUsage: tmrename  <newName> "for current tmux-session"'

    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    if [[ $# == 2 ]] ; then
        oldName=$1
        newName=$2

        tmux rename -t${oldName} ${newName}
    fi

    if [[ $# == 1 ]] ; then
        if [ -z "$TMUX" ] ; then
            echo "is not in tmux-session, must specify <oldName> <newName>"
        else
            oldName=$(tmux display-message -p "#S")
            newName=$1
            tmux rename -t${oldName} ${newName}
        fi
    fi

    # }}}
}
alias tmr=tmrename
