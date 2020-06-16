# vim:set foldmethod=marker  foldlevel=0: vim modeline

# listFuns
# grep -e "^{" functions.txt  -B 1 |grep -v {  | grep -v -e "--" |cat -n |grep filep
# 通过declare  -f 列出当前bash环境中所有的function
#function  listFuns {

listFuns()
{
    # {{{
    #local Ope=' declare -f           | \
                #grep  -e  "^{" -B  1 | \
                #grep  -v  {          | \
                #grep  -v  -e   "--"  | \
                #sort'
    # zsh support
    local BashOpe='declare -f | grep  -e  "^{" -B  1 | grep  -v  {  | grep  -v  -e   "--" | sort'

    if [ $# -eq 0 ]
    then
        eval $BashOpe
        return
    fi

    if [ $1 = '-n' ]
    then
        eval $BashOpe | cat -n
        return
    fi

    echo "Usage:  listFuns [-n]"
    echo "        lf       [-n]"
    return
    # }}}
}
alias lf=listFuns       # 添加 listFuns的alias


# set-title
# 技巧: 按照terminal的tab排序, 可以set-title命名tab title为"1 <name>", "2 <name>", "3 <name>"
# 这样alt+1, alt+2, alt+3 就可以调到相应的tab
# 在tab中使用tmux开启的tmux tab, 非常好用
function set-title()
{
# {{{

    # 比较数值大小, 要在[] 中使用-lt, -eq, -gt, -le, -ge
    # 不能使用<, >
    if [ $# -lt 1 ]
    then
        echo "Usage:  set-title  <terminal-title>"
        echo "        stl  <terminal-title>"
        return -1
    fi

    # 因为title 是通过PS1后面追加字符串添加字符的
    # 所以需要ORIG保存之前PS1 字符串
    # 每次bash 开启新的bash进程后, PS1 变了, 自然title也变了
    if [[ -z "$ORIG"  ]]; then
        ORIG=$PS1
    fi
    TITLE="\[\e]2;$*\a\]"
    PS1=${ORIG}${TITLE}
    # "\[\e]2;$TITLE\a\]" 就是用来设置titile的, 把这个追加到PS1之后
    # echo $PS1     可以查看PS1 和 title关系
    #alias  stl=set-title           # 如果alias放在function中, 必须执行func, alias才起作用
# }}}
}
alias  stl=set-title


# cpuinfo 查看CPU: 颗数, 核数, 超线程数
# 总逻辑CPU数 = 物理CPU个数 X 每颗物理CPU的核数 X 超线程数
# awk 中 {print $2} 外要用''单引号, 不可以使用双引号
function cpuinfo {
# {{{
    blankLine
    echo "============================================================"
    grep name /proc/cpuinfo | uniq                 # show cpu detial(company, architecture, name)
    echo "============================================================"
    blankLine

    cpuSockets=$(grep "physical id" /proc/cpuinfo | sort| uniq| wc -l)  # 查看物理CPU颗数

    cpuCores=$(grep "cpu cores" /proc/cpuinfo | uniq | awk -F: '{print $2}')    # 核数

    cpuSuperThreads=$(grep "processor" /proc/cpuinfo | wc -l)                # 查看逻辑CPU的个数( 超线程数 )

    # 因为 cpuCores 是通过awk过滤出来的数字, 数字前已经有一个空格了
    # 所以其它变量前多加一个空格, 输出比较整齐
    echo  "total CPU Sockets       :  $cpuSockets"                                      # 输出CPU颗数
    echo  "per Socket's Cores      : $cpuCores"
    echo  "per Core's SuperThreads :  $cpuSuperThreads"

    blankLine
# }}}
}


# runback, runtime, rune2o, runo2n, runa2n, rune2n
# {{{

# backrun: 使用 nohup & 运行程序
# 对程序的包裹: runback
# 之所以使用runback这个名字, 是为了和run-err2out名字前缀一直
# 今后所有对命令的包裹: 或许都会以run开头
# example:  runback  gedit  README
function  runback {
    # {{{
    UsageMsg="backrun  <prog  parameter>"
    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    # 将传入的命令使用nohup &包装
    nohup  $*  &
    # }}}
}

# 使用time统计程序运行时间: 因为time是bash内置关键字(不是内置命令)
# 所以time也可以执行bash function 和alias.
function  runtime {
    # {{{
    UsageMsg="runtime  <prog  parameter>"
    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    # 如果命令是alias, 就需要eval两边解析.
    # 还有注意: ls 输出的颜色, 在runtime依旧在, successMsg的彩色也在.
    eval time  $*
    # }}}
}

# out, err, null, all: redirection
# 对于命令输出重定向的包装
# 没有提供"run-out2err", 因为感觉没有这种需求
function run-err2out {
    # {{{
# 将命令的std Err 重定向到 std Out
    #ToDire='2>&1'
    #$*  $ToDire
    $* 2>&1
    # }}}
}

# 将命令的所有到屏幕的输出, 都重定向到/dev/null ,即过滤输出
function run-all2null {
    # {{{
    #ToDire='2>&1'
    #$*  $ToDire

    # 要先将1重定向到/dev/null, 然后将2定向到1, 这样才可以
    # 当然也可以直接将 1 和 2 都重定向到 /dev/null

    #$*  >/dev/null  2>/dev/null    # 另一种方便的写法
    #$* 2>&1  >/dev/null            # 这个是逻辑错误写法, 这样2输出到了1(std out), 1重定位到了/dev/null
    $*  >/dev/null  2>&1
    # }}}
}

# std cout >> /dev/null
function run-out2null {
    $*  >/dev/null
}

function run-err2null {
    $*  2>/dev/null
}
# }}}

alias rune2o=run-err2out
alias runo2n=run-out2null
alias runa2n=run-all2null
alias rune2n=run-err2null


# configurep:  ./configure --prefix=
# 把传入的路径, 变为绝对路径. 因为./configure  --prefix=不支持绝对路径
# 并且打印路径
function  configp {
    # {{{
    UsageMsg="configp  <InstallHome>"
    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    InstHome=$1
    ./configure  --prefix=$InstHome

    echo  "Install Home is $InstHome"
    # }}}
}



#man use vim: Man
# example1: mav bash
# example2: mav 2 time (support number)
function  mav {
# {{{
    UsageMsg='mav  <command>'
    if ! ParaUsage "$UsageMsg"  1  $*; then
        return -1
    fi

    #vim  -c  "Man $*"
    vim  -c  "call ManWinOnly('$*')"
# }}}
}
#alias manv=mav     # 这个alias就没有用过
alias man=mav




# lsb: 显示Linux Release Base
function  lsb {
# {{{
    # under Ubuntu
    # cat /etc/issue
    #cat /etc/lsb-release

    # under CentOS
    #cat /etc/lsb-release

    # standard for all linux(ubuntu, mint, centos)
    cat /etc/os-release
# }}}
}


# protoc : protobuf's compiler
function  myproto {
    #{{{
    UsageMsg='myproto  <out-dir>  file.proto'

    if ! ParaUsage "${UsageMsg}" 2 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    OutDir=$1
    ProtoFile=$2

    protoc  --cpp_out=$OutDir   $ProtoFile
    return $?
    # }}}
}

# example1: createTmpfs  /mnt/myfast
# example2: createTmpfs  /mnt/myfast  2G
createTmpfs()
{
    # Usage: default size is 500M
    # {{{
    UsageMsg='createTmpfs  <dir>  [size]'

    # 至少有1个参数
    if ! ParaUsage "${UsageMsg}" 1 $* ; then
        return -1
    fi

    # 路径
    local  TmpsDir=$1
    if [ ! -d ${TmpsDir} ] ; then       # 如果不存在, 就创建
        if ! mkdir  -p  ${TmpsDir} ; then   # 创建失败就退出
            return $?
        fi
    fi

    # size
    local  TmpsSize=""
    if [ $# -lt 2 ] ; then
        TmpsSize="500M"
    else
        TmpsSize=$2
    fi

    # 开始mount吧
    sudo mount -t tmpfs -o size=${TmpsSize} tmpfs ${TmpsDir}    # 一条命令就可以创建一个tmpfs文件系统

    return  0
    # }}}
}

funclear()
{
    # {{{
    UsageMsg='funclear <fun-name>'

    # 至少有1个参数
    if ! ParaUsage "${UsageMsg}" 1 $* ; then
        return -1
    fi

    local funName=$1

    unset  -f  $funName
    # }}}
}


varclear()
{
    # {{{
    UsageMsg='varclear <var-name>'
    # 至少有1个参数
    if ! ParaUsage "${UsageMsg}" 1 $* ; then
        return -1
    fi

    local varName=$1

    unset  -v  $varName
     # }}}
}

# example: after  5 # 5分钟后关机
after()
{
    # {{{
    UsageMsg='after <minutes>'

    # 至少有1个参数
    if ! ParaUsage "${UsageMsg}" 1 $* ; then
        return -1
    fi

    # 将after的参数传给after函数
    sudo shutdown  -h  $*
    # }}}
}

# 24 gdb-about
# usage: attach pid
# -ex 后面命令要放在一个引号中
attach()
{
    #{{{
    UsageMsg='attach <pid>'

    if ! ParaUsage "${UsageMsg}" 1 $* ; then
        return -1
    fi

    local Ope="sudo gdb -ex"        # 之所以使用sudo, 因为普通用户好像无法调试.

    local Pid=$1
    local ExCmd="attach ${Pid}"

    $Ope "${ExCmd}"
    # }}}
}

# cgdb attach
cattach()
{
    # {{{
    UsageMsg='attach <pid>'

    if ! ParaUsage "${UsageMsg}" 1 $* ; then
        return -1
    fi

    local Ope="sudo cgdb -ex"        # 之所以使用sudo, 因为普通用户好像无法调试.

    local Pid=$1
    local ExCmd="attach ${Pid}"

    eval $Ope "${ExCmd}"
    # }}}
}


# 25: cd src/, cd sources/
cds()
{
    # {{{
    if [ -d src ]; then
        cd src/
        return
    fi

    if [ -d source ]; then
        cd source/
        return
    fi

    if [ -d sources ]; then
        cd sources
        return
    fi

    failureMsg "there is no source directory"
    return -1
    # }}}
}


# cmake clean cache( cmake's cache )
cmake-cache()
{
    # {{{
    local currentDir="./"

    if [ ! $# -lt 1 ] ; then
        currentDir=$1
    fi

    # make sure dir end with  "/"
    #if [ ! "${currentDir}" == "*/"  ]; then
    #if [ ! $currentDir == "*/"  ]; then
        ##currentDir="${currentDir}/"
        #return 0
    #fi

    # ""                  # 为了兼容bash 和 zsh, bash从0起始, zsh从1起始
    local cacheFiles=(
                CMakeCache.txt
                CMakeFiles
                )

    echo $currentDir

    # 这样就可以兼容 bash + zsh 了, 使用这种特殊遍历数组的方法
    for file in "${cacheFiles[@]}"
    do
        echo $file
    done

    # }}}
}
alias cmc=cmake-cache
