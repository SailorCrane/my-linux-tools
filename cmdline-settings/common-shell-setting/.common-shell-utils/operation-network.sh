# vim:set foldmethod=marker  foldlevel=0: vim modeline


# lsport port_num
lsport() {
    # {{{
    local UsageMsg="lsport port_num"
    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    # 目的是查看portNum是哪个进程在用
    # netstat -ln -p        # 也可以达到相同效果 -p显示进程号
    portNum=$1
    sudo lsof -i :$portNum
    # }}}
}


# list all tcp: contain LISTEN/TIME_WAIT/ESTABLISHED...
# usage: lt -h/--help -n/--num
lt() {
    # {{{
    local UsageMsg="lt  [-n/--num]/[-h/--help]"

    local  Ope="netstat -at -p"     # -p 会在最后一列列出pid

    # 没有选项
    if [ $# -lt 1 ]; then
        eval $Ope
        return $?
    fi

    local option=$1
    case "$option" in
        "-h" | "--help")      # help
            successMsg "$UsageMsg"
            return 0
            ;;

        "-n" | "--num" )      # numeric
            eval $Ope  -n
            return $?
    esac

    # 如果可以运行到这里, 说明选项参数错误.
    failureMsg  "$UsageMsg"
    # }}}
}
# 大多数时候tcp很慢, 就是因为将ip或者端口解析为相应的名字. 使用-n选项很快就可以输出.
alias "ltn=lt -n"
alias "ltg=lt -n |grep"


# list tcp listened state
ltl() {
    # {{{
    local UsageMsg="ltl  [-n/--num]/[-h/--help]"

    local Ope="netstat -ltp"        # -p 列出pid
    if [ $# -lt 1 ] ; then
        eval $Ope
        return $?
    fi

    local option=$1
    case "$option" in
        "-h" | "--help")      # help
            successMsg "$UsageMsg"
            return 0
            ;;

        "-n" | "--num" )      # numeric
            eval $Ope  -n
            return $?
    esac

    failureMsg "$UsageMsg"
    # }}}
}
alias ltln="ltl -n"


# list all udp state
# usage: lu -h/--help -n/--num
lu() {
    # {{{
    local UsageMsg="lu  [-n/--num]/[-h/--help]"

    local  Ope="netstat -aup"   # -p 列出进程号

    # 没有选项
    if [ $# -lt 1 ]; then
        eval $Ope
        return $?
    fi

    local option=$1
    case "$option" in
        "-h" | "--help")      # help
            successMsg "$UsageMsg"
            return 0
            ;;

        "-n" | "--num" )      # numeric
            eval $Ope  -n
            return $?
    esac

    # 如果可以运行到这里, 说明选项参数错误.
    failureMsg  "$UsageMsg"
    # }}}
}


# 将输入中的所有ip输出到stdout, 输入可以来自与stdin, 管道, 文件
IpFilter() {
    # {{{
    local IpPart="[0-9]{1,3}"  # Ip字段的一部分, 但是会存在一些不合法的Ip
                               # 将这个变量提取出来, 做的特别漂亮.

    #local Grep="grep --color=always"
    #local Egrep="egrep --color=always"
    local Grep="grep"
    local Egrep="egrep"

    ${Grep} -v inet6 | ${Egrep} -o "(${IpPart}\.){3}${IpPart}"
    # }}}
}


# 在IpFilter的基础上 过滤127 和 255
FinerIpFilter() {
    # 过滤127 + 255
    IpFilter |        \
        grep -v 127 | \
        grep -v 255
}


# 打印本机ip到stdout
ip_info() {
    ifconfig  -a | FinerIpFilter
}



# 传入一个ip, 输出ip的第一部分.
getIpFirstSeg() {
    # {{{
    UsageMsg="getIpFirstSeg <ip>"
    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    local inIp=$1
    echo ${myIp} | awk -F.  '{print $1}'
    # }}}
}


# 列出局域网内启动的主机Ip
# example: localWhoUp 24
# 172 和 192可能都使用24位掩码, 对于掩码不要假设.
localWhoUp() {
    # {{{
    # 其实subMaskNum 也是可以通过ifconfig 的输出过滤255, 然后计算的, 但是不好弄
    # ifconfig | grep $(ip_info) | grep 255. ...

    local UsageMsg="localWhoUp <subMaskNum>"

    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    local  myIp=$(ip_info)
    local  ipFirstSeg=$(getIpFirstSeg ${myIp})      # 获取ip 的第一部分: 192/172
    #echo ${ipFirstSeg}

    #sudo nmap  -sP -PI -PT 192.168.00.0/24
    local scanOpe="sudo nmap -sP"               # 注意一定要有sudo, 没有sudo结果只有自己.
    local subMaskNum=$1

    echo "${scanOpe}  ${myIp}/${subMaskNum}"

    ${scanOpe}  ${myIp}/${subMaskNum} | FinerIpFilter | sort | uniq    # 没有对nmap 的输出过滤出ip, 一股脑儿都输出了.
    # }}}
}
alias "localup=localWhoUp"


# listen <port>
# example: listen  1234     # 在1234 端口上使用nc监听
listen() {
    # {{{

    # HINT: -k 选项keep listen, 不会因为一个客户端退出导致nc程序结束!
    UsageMsg="listen <port> [args]\nExample: 'listen 9000 -k'"
    if ! ParaUsage "${UsageMsg}" 1 $* ; then
        return -1
    fi

    local portNum=$1

    shift
    echo "parameters to 'nc' is [$*]"

    # TODO, if portNum > 1024, use "sudo" prefix

    # nc -l -p $portnum     # -p 可省略
    if (( $portNum < 1024 )); then
        echo "Warning: privileged port num $portNum"
        sudo nc -kl $portNum $*
    else
        # >= 1024
        nc  -kl $portNum $*
    fi
    # }}}
}


# connect [host/ip] <port>
# example1: connect  1234     # connect localhost port
# example2: connect  192.168.3.4  1234      # connect ip's tcp port
#connect() {
conn() {
    # {{{
    UsageMsg="connect  [host/ip]  <port>     : default host is localhost!!!"
    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    if [ $# -eq 1 ];  then
        local portNum=$1
        local hostName=localhost
    fi

    if [ $# -eq 2 ]; then
        local hostName=$1
        local portNum=$2
    fi

    # 也许你需要的是conn
    nc $hostName $portNum -v
    return $?

    failureMsg "${UsageMsg}"
    # }}}
}

test_conn() {
    # {{{
    UsageMsg="connect  [host/ip]  <port>     : default host is localhost!!!"
    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    if [ $# -eq 1 ];  then
        local portNum=$1
        local hostName=localhost
    fi

    if [ $# -eq 2 ]; then
        local hostName=$1
        local portNum=$2
    fi

    # HINT: 仅仅探测端口是否打开
    nc $hostName $portNum -zv
    return $?

    failureMsg "${UsageMsg}"
    # }}}
}
alias tconn="test_conn"


proxy() {
    # 8123: polipo,  8118: privoxy
    #privoxy_proxy
    polipo_proxy
}

polipo_proxy() {
    # {{{
    ADDR="127.0.0.1"
    PORT=8123
    export  http_proxy=http://$ADDR:$PORT
    export  https_proxy=http://$ADDR:$PORT
    export  ftp_proxy=ftp://$ADDR:$PORT        # polipo
    export  no_proxy="127.0.0.0/8,10.0.0.0/24,localhost"                # 设置白名单
    # }}}
}

privoxy_proxy() {
    # {{{
    ADDR="127.0.0.1"
    PORT=8118
    export  http_proxy=http://$ADDR:$PORT
    export  https_proxy=http://$ADDR:$PORT
    export  ftp_proxy=http://$ADDR:$PORT        # privoxy
    export  no_proxy="127.0.0.0/8,10.0.0.0/24,localhost"                # 设置白名单
    #export  no_proxy="127.0.0.0/8,12.12.12.25,10.0.0.0/24,10.96.0.0/12,10.244.0.0/16"      # k8s使用
    #export  no_proxy="127.0.0.0/8,10.0.0.0/24,10.96.0.0/12,10.244.0.0/16"
    # }}}
}


unproxy() {
# {{{
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
# }}}
}


viewproxy() {
# {{{
    echo $http_proxy
    echo $https_proxy
    echo $ftp_proxy
# }}}
}

# =================== batch download =====================
down_ocw() {
    ''' 下载麻省'''
    prefix="https://ia800200.us.archive.org/6/items/MIT6.046JS15/MIT6_046JS15_lec"
    suffix="_300k.mp4"

    #nums=(01 02 03 04 05 06 07 08 09 10)
    #nums=(11 12 13 14 15 16 17 18 19 20)
    #nums=(21 22 23 24 25 26 27 28 29 30)
    #nums=(21 22 23 24 )
    nums=(25 )

    for num in ${nums[@]};
    do
        site=$prefix$num$suffix
        #echo ${site}
        wget $site
    done
}

down_wash() {
    ''' 下载华盛顿'''
    prefix="http://videosrv14.cs.washington.edu/education/courses/csep501/08wi/csep501_08wi_"
    suffix="m.mp4"

    #nums=(1 2 3 4 5 6 7 8 9)
    #nums=(11 12 13 14 15 16 17 18 19 20)

    for num in ${nums[@]};
    do
        site=$prefix$num$suffix
        #echo ${site}
        wget $site
    done
}
