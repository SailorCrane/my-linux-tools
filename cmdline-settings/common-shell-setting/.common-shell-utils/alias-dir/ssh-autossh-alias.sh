
# =================== misc =====================
# 1: ssh可以做到重启服务后, 不丢失已经存在的连接(所以和配置相关的修改重启后, 可能要收手动再连才能生效, 比如GatewayPorts yes)
# detail is following:(sshd通过子进程保持连接: sshd重启后, 子进程配置不变)
# SSHD forks a child process on connection. This child process will not die if either SSHD or the whole network is restarted. This is the reason why you can update ssh and/or its configuration, do a service sshd restart and still keep connected to your old ssh-session with the old settings. Apart from that ssh recovers well from small network outages.


# =================== man =====================
# man sshd_config           # 查看配置详情: 选项可选值...


ssh_back() {
    cp  ~/.ssh/id_rsa      ~/.ssh/id_rsa-back-$(date +"%Y-%m-%d-%H:%M:%S")
    cp  ~/.ssh/id_rsa.pub  ~/.ssh/id_rsa.pub-back-$(date +"%Y-%m-%d-%H:%M:%S")
}

alias ssh_b="ssh_back"

# =================== ssh alias 常用 =====================
ssh_restart() {
    sudo pkill sshd

    # NOTE: WARNING: 这一句可能无法正常执行, 会导致断开连接(必须进入机房才能再次开启ssh)
    # NOTE: WARNING: 必须保存为脚本才能保证从头到尾执行.
    sudo systemctl restart sshd
}

# alias ssh_restart="sudo pkill sshd ; sudo systemctl restart sshd"  # 因为重启sshd, 已经连接的配置不变, 所以这里kill所有连接并重启.
alias ssh_finger_print="ssh-keygen -l -E sha256 -f  $PUB_KEY_FILE"  # 查看ssh服务器指纹: 查看sshd/ssh-server公钥指纹
alias ssh_pub="cat ~/.ssh/id_rsa.pub"  # 查看ssh服务器指纹: 查看sshd/ssh-server公钥指纹
#/etc/ssh/ssh_host_rsa_key.pub
# /etc/ssh/ssh_host_dsa_key.pub
# /etc/ssh/ssh_host_ecdsa_key.pub
# /etc/ssh/ssh_host_ed25519_key.pub
# /etc/ssh/ssh_host_rsa_key.pub


# =================== ssh -X 后, 可以执行远程的图形界面, 并映射到本地(远程需要也支持图形) =====================
alias sshx="ssh -X"
# example: ssh -X user@host
#          firefox
# 可以ssh -X localhost测试


# =================== sshd option, 服务器配置选项 =====================
SSHD=`env which sshd`
alias sshoptions="`env which sshd` -T"      # 普通用户执行(主要是用来检测sshd错误的, 普通用户执行, 会告知无法打开公私钥文件)
# FIXME : ??sshd -o 应该是不退出进程, 临时in-memory修改, 但是不改变配置文件(下次重启还依照配置文件内容设置)
# NOTE: 事实证明sshd -o 不能动态修改配置!!!
# alias ssh_enable_passwd="sudo  $SSHD -o  'PasswordAuthentication yes'"
# alias ssh_disable_passwd="sudo $SSHD -o  'PasswordAuthentication no'"

# alias ssh_enable_gateway="sudo $SSHD -o  'GatewayPorts yes'"                # 外部ssh代理端口, 可否被所有ip访问: 即监听网址是否除了localhost还有外部ip
# alias ssh_disable_gateway="sudo $SSHD -o  'GatewayPorts no'"

# alias ssh_enable_root="sudo $SSHD -o  'PermitRootLogin yes'"        # 默认是prohibit-password(只允许public-key登录)

# =================== 查看sshd服务端的公私钥文件所在 =====================
alias sshdt="sshd -t"           # 普通用户执行(主要是用来检测sshd错误的, 普通用户执行, 会告知无法打开公私钥文件, 可以看到私钥位置)




# =================== ssh 修改端口实践: 假如从7777到22 =====================
# 1: ssh主机 nc -l -k 7777 监听7777端口
# 2: 其它主机 nc ssh_host 7777 (检测是否能够连接)
# 3: 如果不能连接, 查看iptables, 开放7777端口, 并继续使用nc测试
# 4: 如果7777端口ok, ssh端口改至7777, 并重启ssh

# =================== sshd 服务器配置, 详情说明 =====================
# /etc/ssh/sshd_config :
# NOTE: GatewayPorts yes
# NOTE: PasswordAuthentication yes      # 允许密码登录

