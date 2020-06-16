
# 本机关于network各种misc配置等

# =================== Ubuntu的static ip配置 =====================
INTERFACE_FILE="/etc/network/interfaces"
alias interface_config="cat $INTERFACE_FILE"

# =================== common utility ====================
# 6 Ubuntu network  setting: restart/test
# 这里没有添加对于系统的判断, 后期有需要会加上

# 注意 nok只能测试广域网, 不能测试局域网是否通畅
# 因为即使外网(广域网)不通, 局域网也有可能可以访问(大多数时候, 局域网都OK)
# 测试网络是否OK, 使用nok去 向baidu.com 发送4个icmp包测试
alias  nok="ping  www.baidu.com -c 4"

# 查看本地是否可以访问foreigh 网络, 使用nwall 向google.com发送4个icmp包测试
# wall stand for "The Great Fire Wall"
#alias  nwall="ping  www.google.com -c 4"
alias  nwl="ping  www.google.com -c 4"

# 查看是否可以ping通本机的loop网口
# 防火墙测试时, 或者查看lo网卡是否启动时使用
alias  nlo="ping  127.0.0.1  -c 4"

# httpbin是一个测试服务器, 用来测试http客户端/爬虫
alias  get_json="curl 'http://httpbin.org/get'"

alias ncc='nc -C'           # 使得nc发送'CRLF'作为回车行, 行为保持和telnet一致.

alias hosts='cat /etc/hosts'
alias hostsg='cat /etc/hosts | grep --color'

alias ports="cat /etc/services"
alias portsg="cat /etc/services | grep"

alias mtu="netstat -i"      # ifconfig -a | grep mtu -i -w
alias route_net="netstat -r"    # 查看路由表, 和route命令功能一样
alias mac="ifconfig | grep hwaddr -i"

# =================== internet network =====================
# 猜测whois应该是从 NIC官网获取信息
# whois 61.164.142.178        # 乐清县电信分公司 : 61.164.142.0 - 61.164.142.255
# whois 47.52.156.155         # 阿里: 可以看到申请的网段(alibaba) 47.52.0.0 - 47.52.255.255
# whois 119.28.17.79          # 腾讯: 119.28.0.0 - 119.29.255.255

# =================== restart network  =====================
# mint18 (base on Ubuntu 16.04)
#sudo systemctl restart  NetworkManager
#sudo systemctl restart NetworkManager-wait-online.service
#sudo service NetworkManager  restart


# Ubuntu
#sudo service network-manager restart

# network manager restart
# sudo service network-manager stop
# sudo rm -rf /var/lib/NetworkManager/NetworkManager.state
# sudo service network-manager start



