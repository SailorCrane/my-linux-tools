

# capture filter:
# https://wiki.wireshark.org/CaptureFilters
# 使用 Berkeley Packet Filter (BPF) syntax
# -f specify capture filter(used by kernel hook)(内核不支持httpfilter, 所以capture 不支持http)
# tcpdump/Windump 使用的也是BPF语法
# 多个端口: "port 8086 or port 8080 "
# dst port 135 or dst port 445      # dest
# tcp src port 443 and              # src
# tcp port 53 or tcp port 55        # or
# host a or tcp port 55        # or

# display filter:
# display filter只影响显示结果, 不影响保存结果! http是应用层, 所以可以在这里filter "http"
# https://wiki.wireshark.org/DisplayFilters
# ip.src==192.168.0.0/16 and ip.dst==192.168.0.0/16
# tcp.port eq 25 or icmp

alias capture_filter="wireshark -i 2 -k -f 'tcp port 443'"     # capture 端口
alias capture_filter="wireshark -i 2 -k -f 'host 192.168.1.1'" # captrue ip

# NOTE wireshark filter无法识别 http response
# 打开 edit -> preference -> protocol -> tcp -> disable "allow subdissector to reassemble TCP stream"

