
# iptables是基于linux内核netfilter模块来实现的
# netfilter在网络进出过程中, 产生相应的事件, 事件可被监听(hook), 做拦截处理, 即filter

# iptable 不使用 -t指定, 默认使用filter


ipport() {
    PORT=$1
    sudo iptables -A INPUT -p tcp --dport $PORT -j ACCEPT
}

ipportu() {
    PORT=$1
    sudo iptables -A INPUT -p udp --dport $PORT -j ACCEPT
}

ipd() {
    # delete
    IDX=$1
    sudo iptables -D INPUT $IDX
}


alias ipl="sudo iptables -vnL --line-numbers"        # -v显示网络流量统计情况
alias ipln="sudo iptables -t nat -vnL --line-number" # -t nat 查看nat 转发规则
alias iplt="sudo iptables -t nat -vnL --line-number" # -t nat 查看nat 转发规则
alias ipz="sudo iptables -Z"                         # 清空所有统计信息, 用于优化规则

# start and stop
alias ipt_start="sudo systemctl start iptables"
alias ipt_stop="sudo systemctl stop  iptables"

# flush
alias ipt_flush="sudo iptables --flush"            # 清空filter所有iptables规则
alias ipt_flush_nat="iptables -t nat --flush"      # 清空net所有iptables规则
alias ipt_flush_input="iptables -t filter --flush" # 清空filter INPUT链 所有规则

# list: -n 直接显示num和host_ip, 速度更快
alias ipt_list_filter="sudo iptables -t filter --list -n"
alias ipt_list_mangle="sudo iptables -t mangle --list -n"
alias ipt_list_nat="sudo iptables -t nat --list -n"
alias ipt_list_raw="sudo iptables -t raw --list -n"


# 添加rule: add 添加rule在末尾, insert默认添加rule在开头
alias ipt_add_rule="sudo iptables -A"         # ipt_add_filter INPUT    -s 192.168.1.139 -j REJECT
alias ipt_ins_rule="sudo iptables -I"         # ipt_ins_rule   OUTPUT
alias ipt_del_rule="sudo iptables -D"         # ipt_del_rule   OUTPUT 1, 删除第一条rule

# 添加新的chain
alias ipt_new_chain="sudo iptables -t filter -N"          # ipt_new_chain IN_WEB
alias ipt_del_chain="sudo iptables -t filter -X"          # ipt_del_chain IN_WEB (只有chain引用计数为0时才能删除chain, 否则提示Too many links)
# alias ipt_ins_chain="sudo iptables -t filter -I INPUT -s 192.168.1.198 -j IN_WEB" # 将IN_WEB chain 插入到 INPUT链中
# alias ipt_ins_chain="sudo iptables -t filter -I INPUT 192.168.1.198 -j IN_WEB"    # 将IN_WEB chain 插入到 INPUT链中


# 设置默认规则
alias ipt_policy_chain="sudo iptables -t filter -P"       # 设置ipt_policy_chain INPUT DROP


# ------------------- NOTE:保存目录自己指定即可  ---------------------
SAVE_FILE="/etc/iptables.rules"
alias ipt_save="sudo bash -c 'iptables-save > $SAVE_FILE'"
alias ipt_restore="sudo bash -c 'iptables-restore < $SAVE_FILE'"



# =================== iptables nat tcp connection =====================
# 对于这种connection, netstat -ltn 不会显示出来
# NOTE: sudo cat /proc/net/nf_conntrack 文件
# sudo netstat-nat -n
# sudo netstat-nat -np tcp

# ------------------- FAQ ---------------------
## iptables flow如下, 如果把iptables 所在host/主机,
## 理解为一台路由器, 那么这个process flow就很好理解
## 了. POSTROUTING和OUTPUT区别: OUTPU只有本地包用, postrouting 转发和本地发出的都会用
# prerouting <routing> input | output postrouting # 发给本机的
# prerouting <rouging> forward postrouting      # 使用本机作为路由器的

