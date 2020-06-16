

alias t="ctime"                 # 是自己实现的bin/中的一个python程序

# date +"[%d/%b/%Y:%k:%M:%S %z]"                    # %b当地月份
#alias datef='date +"%Y-%m-%d-%k:%M:%S"'
alias datef='date +"%Y-%m-%d-%H:%M:%S"'
alias nettime_on="sudo timedatectl set-ntp on"      # enable网络时间同步
alias nettime_off="sudo timedatectl set-ntp off"    # disable网络时间同步(只有如此, date才可以设置系统时间)

# alias dates="sudo date -s"     # 修改时间, dates 03/09/19, dates 08:25:59, date -s 20080523, date -s "20080523 01:01:01"

datep() {
    while true; do
        date
        sleep 1
    done
}


# https://stackoverflow.com/questions/16548528/command-to-get-time-in-milliseconds
alias timestamp="date +%s"     # 查看主机s级时间戳
alias timestampm="date +%s%3N" # 查看主机ms级时间戳
