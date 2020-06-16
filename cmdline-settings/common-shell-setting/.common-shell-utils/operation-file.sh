# vim:set foldmethod=marker  foldlevel=0: vim modeline

# 去掉文件名中的空格: " " ===> "-"
elim_file_name_space() {
    # {{{
    # 去掉文件名中的空格
    #UsageMsg="elim_space <fileName> [replace_space_with]"
    UsageMsg="elim_space <fileName> <fileName2>"

    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        # echo "Example elim_space  'a\ b\ c.txt' -"
        #echo "Example elim_space  'a\ b\ c.txt'  'd\ f\ .txt'"
        echo "Example:  elim_space   file1.txt  file2.txt"
        return -1
    fi

    ReplaceWith="-"

    # FileName=$1
    # if [ $# -eq 2 ]; then       # -ge stand for : greator or equal
    #     ReplaceWith=$2
    # fi

    for fileName in $@; do
        echo $fileName
        rename "s/ /$ReplaceWith/g"  $fileName
    done

    # }}}
}
alias space2hyphen="elim_file_name_space"
alias blank2hyphen="elim_file_name_space"       # 修改文件名

# NOTE: 将"file-operation.sh", "tmux-operation.sh"===> "operation-file.sh", "operation-tmux.sh"
rename_prefix_suffix() {
    #{{{
    for file in *operation.sh ; do
        prefix=${file%*-operation.sh}
        # suffix=${file#*operation.sh}
        suffix="operation.sh"
        echo $prefix
        mv $file operation-${prefix}.sh
        echo
    done
    #}}}
}

backup() {
    # support dir
    UsageMsg="backup <file_dir_name>"
    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        echo "Example: backup  ~/test"
        return -1
    fi

    FILE=$1
    # DATE=`date --iso-8601`
    # DATE=`date --iso-8601=seconds`
    # DATE=`date +"%Y-%m-%d-%h:%m:%s"`
    # DATE=`date +"%Y-%m-%d-%k:%M:%s%z"`     # %s:时间戳(不是秒), %S: 秒, %z:zone, 时区
    DATE=`date +"%Y-%m-%d-%H:%M:%S"`
    NEW_FILE=$1-backup-${DATE}
    mv $FILE $NEW_FILE
}

