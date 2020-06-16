
# tcpdump -i any        # accept any interface
alias  tcpdump="tcpdump -en"            # -e显示ethernet信息(mac地址)
alias  tcp_local="sudo tcpdump -i lo port" # 方向默认是 dst or src
alias  tcp_port="sudo tcpdump -i any port 8888"        # 查看8888端口的消息
alias  tcp_icmp="sudo tcpdump -i any icmp"        # 查看icmp
alias  tcp_ip="sudo tcpdump -i any ip"
alias  tcp_tcp="sudo tcpdump -i any tcp"
alias  tcp_udp="sudo tcpdump -i any udp"
alias  tcp_arp="sudo tcpdump -i any arp"

# alias  tcp_n="sudo tcpdump -n -i br0"     # -n(--number)

