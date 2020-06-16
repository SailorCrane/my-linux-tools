
dockerfile_nc : nc backend server 镜像

dockerfile_habase :  haproxy base(里面安装了keepalived, haproxy等)

dockerfile_haproxy : 在haproxy base基础上, 添加配置文件


ha_checkhaproxy: keepalived 用来检测haproxy的脚本

config_haproxy.conf : haproxy 配置文件

config_keepalived_d1.conf : keepalived 配置文件

