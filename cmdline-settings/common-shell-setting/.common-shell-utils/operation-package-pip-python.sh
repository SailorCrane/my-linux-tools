# vim:set foldmethod=marker  foldlevel=0: vim modeline


# pip search
# example: pips  /bin/bash
#          pips  -h /bin/bash
# "pips" stand for "pip search"
# 注意 "函数名" 和 "{" 之间必须有一个空格" "
# 否则bash视为语法错误
# -h 表示是否 使用 header选项
function  pip_search {
# {{{
    #set -x

    # 注意赋值变量: = 左右不要有空格, 因为这个问题, 已经调试过很多次了
    usageMsg="Usage: pips  <packageName> [-h]"
    Ope=$1
    shift

    # -h: search head, use "grep ^"
    if [ $# -eq 2 ]
    then
        if [ $2 = "-h" ]
        then
            packageName=$1
            ${Ope} search $packageName | grep "^"$packageName         # 准确搜索$packageName, 过滤掉一些模糊搜索结果
            return $?
        else
            echo $usageMsg
            return -1
        fi

        return
    fi

    # 只有一个参数: 参数是packageName
    if [ $# -eq 1 ]
    then
        packageName=$1
        ${Ope} search $packageName | grep $packageName         # 准确搜索$packageName, 过滤掉一些模糊搜索结果
        return $?
    fi

    # 如果上述参数条件都不符合
    echo $usageMsg
    return  0

    # 其实应该是在每个return之前都 set +x
    #set +x
# }}}
}
alias pips="pip_search pip"
alias pips2="pip_search pip2"
alias pips3="pip_search pip3"
