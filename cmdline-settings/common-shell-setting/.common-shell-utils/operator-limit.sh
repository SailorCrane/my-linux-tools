
pidof() {
    processName=$1
    pid=$(ps aux | env grep $processName | env grep -v  grep | awk '{print $2}')
    echo $pid
}

limitf() {
    # 查看进程的limits
    processName=$1
    pid=$(pidof $processName)
    # cat /proc/$pid/limits
    limitp $pid
}

limitp() {
    # 查看某进程process id的对应的limits
    pid=$1
    cat /proc/$pid/limits
}
