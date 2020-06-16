# vim:set foldmethod=marker  foldlevel=0: vim modeline

GrepOpe="egrep --color=always"

extractBashComments() {
    $GrepOpe "^#" $*
}

# 显示空行: 什么字符都没有的行
extractNothingLine() {
    $GrepOpe "^$" $*
}

# 过滤空行
filterNothingLine() {
    #$GrepOpe "^$" $* -v
    extractNothingLine  -v $*
}

# 显示只有空格或者tab的行
blankMatch="[[:space:]]"        # 国际标准 表示空格, 或者tab
extractBlackLine() {
    $GrepOpe "^${blankMatch}*$" $*
}


# 过滤只有空格或者tab的行
filterBlackLine() {
    extractBlackLine -v $*
}

# grepd: grep dir 递归搜索当前目录
grepd() {
    # {{{

    #local Ope='grep --color'        # --color=auto
    local Ope='grep'        # --color=auto

    UsageMsg="grepd  <pattern> [dir] [other grep options]"
    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    local searchDir="."
    local searchPattern=$1

    # 这之前不能shift, 会打乱参数顺序, 让if 中参数索引出错.
    if [ $# -ge 2 ]; then       # -ge stand for : greator or equal
        searchDir=$2
        shift                    # now $* is [other grep options: from $3 ....]
    fi

    # 对所有参数处理完毕后, 再shift
    shift       # shift 1位

    # exclude ".git/" dir, last grep just to add color to pattern
    $Ope $searchPattern $searchDir  -r  $*  | grep -v "\.git/"  | grep $searchPattern --color
    # }}}
}


# swap string
swap-string() {
#{{{
    UsageMsg="swap-string <old> <new> <files>"

    if ! ParaUsage "${UsageMsg}" 3 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    old=$1
    new=$2
    shift 2

    sed -ri "s/$old/$new/" $*
#}}}
}

