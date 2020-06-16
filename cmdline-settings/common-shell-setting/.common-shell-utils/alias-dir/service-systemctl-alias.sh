
# like service, or invoke-rc.d

alias sre="sudo systemctl daemon-reload"
# 可以看到: 是否开机enable + service定义文件目录 + Exec等所有信息 + bin文件所在 + 启动参数 + 配置文件
# vendor preset enabled: 是什么?
alias sss="sudo systemctl status"

# enable的文件会在"/etc/systemd/system"下创造soft link文件(disable会删除软连接)
# 但是mysql并没有在这里创建软连接(如何实现的)
alias sen="sudo systemctl enable"
alias sden="sudo systemctl disable"

alias sst="sudo systemctl start"
alias sstp="sudo systemctl stop"        # dstp停止docker, sstp停止service
alias srst="sudo systemctl restart"
alias sca="sudo systemctl cat"          # sca influxdb: 查看service的配置文件

# =================== influxdb目录 =====================
# 关于influxdb删除/var/lib/influxdb目录后, 无法启动的问题
# 要保证"influxdb"用户可以在"/var/lib/"下创建"influxdb/"目录, 或者创建目录后, 手动chown为"influxdb"用户
