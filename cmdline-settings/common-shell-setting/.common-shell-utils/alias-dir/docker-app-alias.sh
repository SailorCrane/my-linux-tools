
# ===================  mysql =====================
# run docker  mysql in default port, passwd 123456
#     connect mysql
c_sql_port=3307      # crane mysql port
c_sql_passwd=passwd_13579  # crane mysql passwd

# dmysql: d表示 detached run
# mysql 使用--pid host创建, 这样可以在本地ps进程中看到mysql
# sudo unshare --pid --uts --ipc --mount -f chroot rootfs /bin/sh

# NOTE: 使用 和 busy相同的net和container
# docker run --pid=container:busy --net=container:busy --name mybusy -itd busybox

alias dmysql="sudo docker run --name first-mysql --pid host -p ${c_sql_port}:3306 -e MYSQL\_ROOT\_PASSWORD=${c_sql_passwd} -d mysql"


alias cmysql="mysql -h127.0.0.1 -P${c_sql_port} -uroot -p${c_sql_passwd}" # cmsyql : stand for connect
alias denter-mysql="denter first-mysql"

# =================== 部署docker registry =====================
# dtag redis localhost:5000/redis                # 1: tag, NOTE: tag需要":5000"
# { "insecure-registries":["hehemiao.cn:5000"] } # 2: 在 /etc/docker/daemon.json中添加这样的insecure-registries指示, 这样
# dpu  redis localhost:5000/redis                # 3: push
# dpl  localhost:5000/redis                      # 4: pull
# du -hs /var/lib/registry                       # 这个不一定大于docker images看到的镜像大小(因为docker存储会有压缩的)
alias dregistry="sudo docker run                   \
            --name first-registry                  \
            -p 5000:5000                           \
            -itd                                   \
            -v /var/lib/registry:/var/lib/registry \
            registry"

# 证书环境变量指定了docker中的地址, 映射到本地地址
alias dregistry_https="sudo docker run -d                       \
            -p 5000:5000 --restart=always --name https-registry \
            -v /var/lib/registry:/var/lib/registry              \
            -v /etc/docker_registry/certs:/certs                \
            -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/server.crt  \
            -e REGISTRY_HTTP_TLS_KEY=/certs/server.key          \
            registry:2"

alias denter-registry="denter first-registry sh"       # 这里一定要指定sh, 因为registry没有bash
# 查看 registry仓库目录:
# denter-registry 后, ps aux 查看registry命令配置文件, cat 查看配置文件中内容即可

# dtag registry localhost:5000/registry
# dpu localhost:5000 localhost:5000/registry

# =================== linux distribution: ubuntu, CentOS, archlinux =====================
# TODO 指定image版本
APT_LOCAL="/mySaved/oh-my-linux-tools/apt-source-setting/ubuntu-16-xential.list"
APT_DIR="/etc/apt/sources.list"

alias dubuntu="sudo docker run -itd        \
                    -v $PWD/data:/data     \
                    -v $APT_LOCAL:$APT_DIR \
                    --privileged=true      \
                    --name ubuntu          \
                    ubuntu:16.04"

alias dubuntu2="sudo docker run -itd       \
                    -v $PWD/data:/data     \
                    -v $APT_LOCAL:$APT_DIR \
                    --privileged=true      \
                    --name ubuntu2         \
                    ubuntu:16.04"

alias dhaproxy="sudo docker run -itd   \
                    -v $PWD/data:/data \
                    --privileged=true  \
                    --name haproxy     \
                    ubuntu"

# TODO 指定image版本
alias dcentos="sudo docker run -itd    \
                    -v $PWD/data:/data \
                    --name centos      \
                    centos"

# TODO 指定archlinux镜像版本
alias darch="sudo docker run -itd      \
                    -v $PWD/data:/data \
                    --name arch        \
                    archlinux/base"

# =================== busybox =====================
alias dbusy="sudo docker run --name busy --privileged=true -itd busybox"
alias dbusy2="sudo docker run --name busy2 --privileged=true -itd busybox"
alias dhost="sudo docker run --pid host --net host --name host-busy -itd busybox"
alias denter-busybox="sudo docker exec -it busy /bin/sh"     #   denter是一个自定义的alias
alias denter-busybox2="sudo docker exec -it busy2 /bin/sh"     #   denter是一个自定义的alias
# alias denter-busybox="denter busy sh"     #   denter是一个自定义的alias


# ===================  nginx =====================
alias dnginx="drunitd -p 8080:80 --name first-nginx nginx"
alias denter-nginx="denter first-nginx sh"

# =================== qq =====================
# tim 办公qq
# sudo docker pull bestwu/qq:office
alias dqqtim="sudo docker run -d --name qq-tim \
    --device /dev/snd \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/TencentFiles:/TencentFiles \
    -e DISPLAY=unix$DISPLAY \
    -e XMODIFIERS=@im=fcitx \
    -e QT_IM_MODULE=fcitx \
    -e GTK_IM_MODULE=fcitx \
    -e AUDIO_GID=`getent group audio | cut -d: -f3` \
    -e VIDEO_GID=`getent group video | cut -d: -f3` \
    -e GID=`id -g` \
    -e UID=`id -u` \
    --restart=always \
    bestwu/qq:office"

# 普通qq
# sudo docker pull bestwu/qq:im
alias dqq="sudo docker run -d --name qq-im \
    --device /dev/snd \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/TencentFiles:/TencentFiles \
    -e DISPLAY=unix$DISPLAY \
    -e XMODIFIERS=@im=fcitx \
    -e QT_IM_MODULE=fcitx \
    -e GTK_IM_MODULE=fcitx \
    -e AUDIO_GID=`getent group audio | cut -d: -f3` \
    -e VIDEO_GID=`getent group video | cut -d: -f3` \
    -e GID=`id -g` \
    -e UID=`id -u` \
    bestwu/qq:im"

# =================== date volume container =====================
alias dvolume="drunitd -v /tmp/test --name data-c ubuntu true"
# --volumes-from

# =================== redis: mater, slave =====================
alias dredis="sudo docker run -p 6379:6379 -v $PWD/data:/data \
                    -d redis:3.2 redis-server \
                    --appendonly yes \
                    --cluster-enabled yes"

# =================== gitlab =====================
# 连接localhost:80　gitlab, 密码还不知
alias dgitlab="sudo docker run --detach       \
    --publish 443:443 --publish 80:80         \
    --name gitlab                             \
    --restart always                          \
    --volume /srv/gitlab/config:/etc/gitlab   \
    --volume /var/log/gitlab:/var/log/gitlab  \
    --volume /var/opt/gitlab:/var/opt/gitlab  \
    gitlab/gitlab-ce:latest"

# =================== mongodb =====================
alias dmongo="sudo docker run \
    -p 27017:27017            \
    --name mongo              \
    -v $HOME/mongodb:/data/db  \
    -d                        \
    mongo"


# http://www.mongoing.com/docs/tutorial/convert-standalone-to-replica-set.html
alias dmongors="dmongo -replSet 'rs0'" # 完了在mongo客户端执行: rs.initiate(),
                                       # rs.conf()显示replicas-set配置.
                                       # rs.status() 显示replica-set 状态
                                       # rs.add("ip:port") 添加replica

alias dmongoauth="dmongo --auth" # 完了在mongo客户端执行: rs.initiate(),

# =================== cadvisor =====================
# /:/rootfs 用于让cadvisor读取宿主系统cpu信息等
# /var/lib/docker 映射， 使得cadvisor可以获取docker的信息
alias dcadvisor="sudo docker run             \
--volume=/:/rootfs:ro                        \
--volume=/var/run:/var/run:rw                \
--privileged=true                            \
--volume=/sys:/sys:ro                        \
--volume=/var/lib/docker/:/var/lib/docker:ro \
--publish=8080:8080                          \
--detach=true                                \
--name=cadvisor                              \
--restart=always                             \
google/cadvisor:v0.24.1"

# ------------------- jenkins ---------------------
alias djenkins="sudo docker run -idt       \
    --name jenkins                         \
    -p 9090:8080                           \
    jenkins"
    # -v /var/lib/jenkins_home:/var/jenkins_home \


# =================== influxdb =====================
alias dinflux="sudo docker run -idt        \
    --name influxdb                        \
    -p 8086:8086                           \
    -v /etc/influxdb/influxdb_1.7.conf:/etc/influxdb/influxdb.conf \
    -v /var/lib/influxdb:/var/lib/influxdb \
    influxdb"

# tmp lib influx
alias dinfluxtmp="sudo docker run -idt      \
    --name influxdbtmp                      \
    -p 8086:8086                            \
    -v $HOME/tmp/influxdb:/var/lib/influxdb \
    influxdb"

# 使用docker exec 进入已运行的容器(docker exec 在已启动的容器中运行命令)
alias datinflux="sudo docker exec -it influxdb /bin/bash"

# =================== tmp =====================
alias ddb="sudo docker run -itd --name dbmanager dbmanager"
