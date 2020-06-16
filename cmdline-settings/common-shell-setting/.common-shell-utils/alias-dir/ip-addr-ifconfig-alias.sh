
# ------------------- ip addr ---------------------

# ------------------- ifconfig ---------------------
# ifconfig lo mtu 6550          # 设置MTU
# ifconfig eth0 192.168.1.1     # 设置ip地址

# ifconfig eth0:0 192.168.1.1   # 设置另一个ip地址, 一台主机多个ip(Alias)
# ifconfig eth0:0 down          # 删除 Alias

# ifconfig eth0 netmask 255.255.255.0   # /24 掩码
# ifconfig eth0 broadcast 172.16.25.63  # 设置广播地址
# ifconfig eth0 multicast 231.0.0.134   # 多播组ip[224.0.0.0 ---> 239.255.255.255]

# ifconfig eth0 hw ether AA:BB:CC:DD:EE:FF  # 修改mac地址
alias ifc="ifconfig"
