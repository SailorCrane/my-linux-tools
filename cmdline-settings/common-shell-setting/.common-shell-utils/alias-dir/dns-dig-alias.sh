
# dns相关

# a.root-servers.net  198.41.0.4, 2001:503:ba3e::2:30 VeriSign, Inc.
# b.root-servers.net  199.9.14.201, 2001:500:200::b   University of Southern California (ISI)
# c.root-servers.net  192.33.4.12, 2001:500:2::c  Cogent Communications
# d.root-servers.net  199.7.91.13, 2001:500:2d::d University of Maryland
# e.root-servers.net  192.203.230.10, 2001:500:a8::e  NASA (Ames Research Center)
# f.root-servers.net  192.5.5.241, 2001:500:2f::f Internet Systems Consortium, Inc.
# g.root-servers.net  192.112.36.4, 2001:500:12::d0d  US Department of Defense (NIC)
# h.root-servers.net  198.97.190.53, 2001:500:1::53   US Army (Research Lab)
# i.root-servers.net  192.36.148.17, 2001:7fe::53 Netnod
# j.root-servers.net  192.58.128.30, 2001:503:c27::2:30   VeriSign, Inc.
# k.root-servers.net  193.0.14.129, 2001:7fd::1   RIPE NCC
# l.root-servers.net  199.7.83.42, 2001:500:9f::42    ICANN
# m.root-servers.net  202.12.27.33, 2001:dc3::35  WIDE Project

# _dnsauth  TXT 默认    201901220203224y28347kkha3pma6vsw77rtnmicu7magzt3wyf58j4j7o6ev8q    -   600
# host也可以查看dns的type, 和dig用法一致
# nslookup 呢?未试验.
alias dig_txt="dig -t txt _dnsauth.hehemiao.cn"     # host -t txt _dnsauth.hehemiao.cn
alias dig_cname="dig -t cname git.hehemiao.cn"      # host -t cname
alias dig_ip="dig -t a game.hehemiao.cn"            # host -t a game.hehemiao.cn


# =================== dns =====================
DNS_FILE="/etc/resolv.conf"                 # DNS server配置列表
DNS_PRECEDENCE="/etc/nsswitch.conf"         # domain 解析顺序(hosts, dns)
#alias dns_servers="cat $DNS_FILE"
alias dns_servers="nmcli | grep DNS -i -C 30"
alias dns_precedence="cat $DNS_PRECEDENCE"
