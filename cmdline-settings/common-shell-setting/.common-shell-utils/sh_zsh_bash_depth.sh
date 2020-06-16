# vim:set foldmethod=marker  foldlevel=0: vim modeline

# 使用pid 是为了区分: source .zshrc 和 zsh 新进程

# 虽然 bash/zsh 支持 $SHLVL, 但是表现与sh_depth功能略不同,
# $SHLVL不一定每次重启shell, 都会增加(比如su -l 切换用户时)
# sh_depth 每次bash/zsh执行时都会增加

tty_depth_dir=${HOME}/.zsh_depth
# declare -g  _TTY_NUM

# =================== system,terminal get =====================
# get_tty_num() {
# }

get_tty_num() {
    # to_err "====tty is $(tty)"
    if [ ! -z "$_TTY_NUM" ] ; then
        echo $_TTY_NUM
        # to_err "hit"
        return
    fi

    _TTY_NUM=$(basename $(tty))
    # to_err "assign" $_TTY_NUM
    echo $_TTY_NUM
}

get_pid() {
    echo $$
}

get_file_name() {
#{{{
    tty_num=$(get_tty_num)
    mkdir -p $tty_depth_dir
    # to_err "get_file_name"  ${tty_depth_dir}/${tty_num} tty_num is $tty_num
    echo ${tty_depth_dir}/${tty_num}
#}}}
}

has_pid() {
#{{{
    local pid=$1
    ps -ef | awk '{print $2}' | grep $pid -w  >> /dev/null
#}}}
}

to_err() {
    msg=$*
    echo $msg 1>&2
}


#=================== file get/set  =====================
# file-foramt (tty, pid, depth)
file_get_tty() {
#{{{
    file_name=$1
    head -1 ${file_name}
#}}}
}

file_get_pid() {
#{{{
    file_name=$1
    if ! [ -e ${file_name} ];
    then
        echo -1
    else
        head -2 ${file_name} | tail -1
    fi
#}}}
}

file_get_depth() {
#{{{
    file_name=$1
    depth=$(tail -1 ${file_name})

    echo $depth
#}}}
}

# setting (tty, pid, depth)
file_set_things() {
#{{{
    file_name=$1
    depth=$2
    # to_err "file_set_things is $file_name $depth"

    tty_num=$(get_tty_num)
    cur_pid=$(get_pid)

    echo $tty_num  > $file_name
    echo $cur_pid >> $file_name
    echo $depth   >> $file_name
#}}}
}


#=================== current depth get/set  =====================
get_current_depth() {
#{{{
    file_name=$(get_file_name)
    if ! [ -e ${file_name} ];
    then
        depth=0
    else
        depth=$(file_get_depth  $file_name)
        # trap EXIT 退出时设置的时退出时的pid, 而不是sup shell pid
        # 所以这里显示时, 更正pid.
        # 或者zsh trap SIGCHILD, 每次更正pid
        # to_err "get_current_depth $file_name $_depth"
        file_set_things $file_name $depth

        #file_pid=$(file_get_pid $file_name)
        #pid=$(get_pid)

        #if ! [ "$pid" -eq "$file_pid" ]; then
            # to_err "not equal"
        #fi
    fi
    echo ${depth}
#}}}
}

set_current_depth() {
#{{{
    _TTY_NUM=$(basename $(tty))         # WARNING: 在这里设置的, 可以被全局访问(在get_current_depth中设置的, 不能被全局访问.)
    file_name=$(get_file_name)
    pid=$(get_pid)
    before_pid=$(file_get_pid ${file_name})

    depth=$(get_current_depth)

    # case 1: first zsh has no depth file
    if (( ${before_pid} == -1 )) ; then
        file_set_things $file_name $depth
        return
    fi

    # case 2: manual source .zshrc
    if (( $pid == $before_pid )); then
        return
    fi

    # case 3: 执行zsh子进程情况
    # if has_pid $before_pid; then
    # fi
    (( depth  += 1 ))
    file_set_things $file_name $depth
#}}}
}

minus_current_depth() {
#{{{
    # zsh exit 时执行
    depth=$(get_current_depth)
    (( depth -= 1 ))

    file_name=$(get_file_name)
    # echo "file_name is ${file_name}"

    if (( depth != -1 )) ; then
        file_set_things $file_name $depth
    else
        # echo "will rm file"
        env rm -f $file_name
    fi
#}}}
}


# =================== common depth operation interface =====================
reset_current_depth() {
#{{{
    file_name=$(get_file_name)
    env rm -f $file_name
    set_current_depth
#}}}
}

clear_depth_files() {
#{{{
    env rm -f $tty_depth_dir/*
#}}}
}

cat_depth_file() {
#{{{
    file_name=$(get_file_name)
    cat $file_name
#}}}
}


# =================== source real run  =====================
# 每次source 时, 都会执行
#{{{
set_current_depth                   # 在 source ~/.subdir/*sh 之后, 再set_current_depth
trap minus_current_depth EXIT       # 注意执行时还在未退出的shell中, pid还是原来进程(所以bug产生了)
#trap minus_current_depth EXIT SIGINT SIGTERM   # exit(C-d) do , and  sigkill can't catch
#trap minus_current_depth EXIT SIGINT SIGTERM   # exit(C-d) do , and  sigkill can't catch
#trap minus_current_depth EXIT SIGINT SIGTERM
#trap "echo Booh!">>/tmp/sig.txt SIGINT SIGTERM


# alias depth=get_current_depth
alias rde=reset_current_depth
alias redepth=reset_current_depth
alias mkdepth="mkdir -p $tty_depth_dir"
alias lsdepth="ls $tty_depth_dir"
alias cleardepth=clear_depth_files
alias catdepth=cat_depth_file
#}}}
