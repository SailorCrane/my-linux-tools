# vim: set foldmethod=marker  foldlevel=0:


# ------------------- forward ---------------------
## ip_forward 内核配置: 决定是否可以像router一样转发!
# alias get_forward="cat /proc/sys/net/ipv4/ip_forward"
# alias dis_forward="sudo sh -c 'echo 0 > /proc/sys/net/ipv4/ip_forward'"
# alias enable_forward="sudo sh -c 'echo 1 > /proc/sys/net/ipv4/ip_forward'"

alias get_forward="sysctl net.ipv4.ip_forward"     # 查看不需要sudo
alias enable_forward="sudo sysctl -w net.ipv4.ip_forward=1"
alias dis_forward="sudo sysctl -w net.ipv4.ip_forward=0"


# ------------------- sysctl ---------------------
# NOTE: 修改的是 /proc/sys/目录下响应变量命作为文件名的内容(虚拟文件系统)
# linux kernel parameter
# 如果需要永久性更改, 需要到 /etc/sysctl.conf 中配置
# net.ipv4.tcp_syn_retries = 3

alias sys_list='sudo sysctl -a'

alias syn_cnt='sysctl net.ipv4.tcp_syn_retries'
alias syn_w='sudo sysctl -w net.ipv4.tcp_syn_retries=3'
alias syn_cnt_re='sudo sysctl -w net.ipv4.tcp_syn_retries=6'

# /etc/sysctl.d/ 和 /etc/sysctl.conf 系统启动时会加载.

# HINT: sysctl -p 是/etc/sysctl.conf中的最新配置立即生效
alias sys_p='sudo sysctl -p'        # sys_p filename: specify kernel from file
                                    # sys_p /etc/sysctl.d/k8s.conf
                                    # sys_p /etc/sysctl.conf


alias sys_reload='sudo sysctl --system'


#------------------- /proc目录 ---------------------
# 查看kernel中关于Ip/Tcp 协议的配置等等: 比如tcp重试次数, timeout等

NET_DIR="/proc/sys/net/ipv4/"
NET_CONF_DIR="/proc/sys/net/ipv4/conf"
alias tcp_options="ls $NET_DIR/tcp_*"
alias ip_options="ls $NET_DIR/ip*"
alias icmp_options="ls $NET_DIR/icmp*"

