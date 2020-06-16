

1: daemon.json 放置在 /etc/docker/daemon.json
    "insecure-registries"存放的是docker 服务器的ip

    也可以放置一些配置选项到这个json文件中: 比如 "iptables" : "true"    # 默认就是true
    HINT: docker login ip/hostname后, 才可以push/pull

2:  docker 放置在 /etc/default/docker, 里面防止docker启动的选项变量 DOCKER_OPTS
    不过/etc/default 只在upstart和SysInit 的init中起作用, 在systemd下不起作用.

    如果在systemd下, 正确使用姿势:

    [Service]
    EnvironmentFile=-/etc/default/docker
    ExecStart=
    ExecStart=dockerd $DOCKER_OPTS
