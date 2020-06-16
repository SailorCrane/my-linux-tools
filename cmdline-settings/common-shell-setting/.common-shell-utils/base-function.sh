# vim:set foldmethod=marker  foldlevel=0: vim modeline

# blankLine, 输出空行
alias blankLine=echo

# 转换为小写
function sh_tolower()
{
    echo $1 | tr '[A-Z]'  '[a-z]'
}

# 转换为大写
function sh_toupper()
{
    echo $1 | tr '[a-z]'  '[A-Z]'
}

#=================== msg =====================
# 带彩色输出信息: 一目了然错误信息.
function  failureMsg {
# {{{
    SETCOLOR_FAILURE="echo -en \\033[1;31m"     # 错误颜色
     SETCOLOR_NORMAL="echo -en \\033[0;39m"     # 之后的颜色恢复正常

    #echo $1  &&  $SETCOLOR_FAILURE
    $SETCOLOR_FAILURE && echo $1        # 先设置颜色, 再输出信息
    $SETCOLOR_NORMAL                    # 之后的颜色要正常才可以
# }}}
}

function  warningMsg {
# {{{
    SETCOLOR_WARNING="echo -en \\033[1;33m"
     SETCOLOR_NORMAL="echo -en \\033[0;39m"     # 之后的颜色恢复正常

    #echo $1  &&  $SETCOLOR_FAILURE
    $SETCOLOR_WARNING && echo $1        # 先设置颜色, 再输出信息
    $SETCOLOR_NORMAL                    # 之后的颜色要正常才可以
# }}}
}

function  successMsg {
# {{{
    SETCOLOR_SUCCESS="echo -en \\033[1;32m"
     SETCOLOR_NORMAL="echo -en \\033[0;39m"     # 之后的颜色恢复正常

    #echo $1  &&  $SETCOLOR_FAILURE
    $SETCOLOR_SUCCESS && echo $1        # 先设置颜色, 再输出信息
    $SETCOLOR_NORMAL                    # 之后的颜色要正常才可以
# }}}
}

#=================== msg =====================


# Usage: ParaUsage <UsageMsg> <ParaNums> [paras......]
# example:  ParaUsage  " command  <dir> <...> "  2  $*
function  ParaUsage {
    # {{{
    UsageMsg=$1
    MinPara=$2
    shift 2

    if [ $# -lt  ${MinPara} ] ; then
        # 注意变量两边加引号, failureMsg将信息用"错误彩色"输出
        # "Usage:" 字符串不用再由调用者指定, 在PairaUsage中指定
        failureMsg  "Usage: ${UsageMsg}"
        return  -1;
    fi

    return 0;
    # }}}
}

# 如果当前用户为root, 返回0.
#           否则, 返回1
function isRoot {
    # {{{
    local userName=$(whoami)
    if [ $userName = "root" ]       # "=" 比较字符串, 既支持zsh, 也支持bash. 但是注意 "=" 左右变量的空格.否则就成为一个赋值表达式.
    then
        return 0        # 0 stand for true
        #return true        # 0 stand for true
    else
        return 1        # non-zeor stand for false
        #return false        # non-zeor stand for false
    fi
    # }}}
}

function  randomString {
    # {{{
    # 将randomString输出到stdout, 没有换行符.
    openssl rand -base64  10 | tr -dc "a-zA-Z"      # openssl wile output random string
    # }}}
}


#如果字符串不以"/"结尾, 添加"/"
addBackSlash()
{
#{{{
    UsageMsg='addBackSlash <string>'

    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    # 注意这里的 */ 不带引号, 才可以使用通配.
    # 如果带"*/", 则是完全匹配, 非通配
    if [[ "$1" == */ ]] ; then
        echo $1     # 如果字符串以"/"结尾, 直接输出
    else
        echo "$1""/"    # 否则， 输出 字符串 + "/"
    fi
#}}}
}

# 注意如果有多个"///", 只能取出一个
trim_back_slash()
{
    echo ${1%%/}
}

# shut <after_minutes| time>
shut()
{
#{{{
    UsageMsg='shut <minutes|1:00>'
    #shutdown -h -t $1
    #shutdown -P $1
    shutdown -h $1
#}}}
}

shuc()
{
    shutdown -c
}

re()
{
    UsageMsg='shut <minutes>'
    shutdown -r $1
}

is_absolute_path()
{
#{{{
    local test_path=$1

    if [[ "$test_path" == /* ]]; then
        return 0
    else
        return -1
    fi
#}}}
}


isfile()
{
    [[ -f $1 ]]
}

isdir()
{
    [[ -d $1 ]]
}


# cd file's dir
cdf()
{
#{{{
    UsageMsg='cdf <file/dir path>'

    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    file_path=$1
    if isdir $file_path; then
        cd $file_path
    elif isfile $file_path ; then
        dir_path=$(dirname ${file_path})
        cd $dir_path
    fi
#}}}
}
