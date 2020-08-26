lt () {
        local UsageMsg="lt  [-n/--num]/[-h/--help]"

        # mac下的netstat不支持 -p查看进程id,所以这里去掉了-p选项
        local Ope="netstat -at "
        if [ $# -lt 1 ]
        then
                eval $Ope
                return $?
        fi
        local option=$1
        case "$option" in
                ("-h" | "--help") successMsg "$UsageMsg"
                        return 0 ;;
                ("-n" | "--num") eval $Ope -n
                        return $? ;;
        esac
        failureMsg "$UsageMsg"
}
