# vim: set foldmethod=marker  foldlevel=0:

# common image registry
# docker.io
# gcr.io
# k8s.gcr.io
# registry.access.RedHat.com
# localhost:5000

dru="/var/run/docker"           # run temporally data
dli="/var/lib/docker"           # 持久化数据(包括创建的容器数据, 镜像数据)


# docker
alias dhe="sudo docker help"
alias dlogs="sudo docker logs -f"
alias dlog="sudo docker logs -f"
alias dlogt="sudo docker logs -f --tail=100"
alias dlogin="sudo docker login"
alias dpsra='eval sudo docker rm "$""(sudo docker ps -a -q)"'       # dpsra, NOTE: 因为没有指定 -f, 所以只删除不再运行的container(不影响运行中的container)
alias dpsraf='eval sudo docker rm "$""(sudo docker ps -a -q) -f"'      # dpsraf, remove all forve
alias dbu="sudo docker build -t"        # dbu sailorcrane:test  dockerfile_dir

#alias dci="sudo docker commit -m "     # dci  'msg'  container_id  image_name(container ------> image)
alias dci="sudo docker commit"        # dci  container_id  image_name(container ------> image)

alias dpl="sudo docker pull"            # dpl  sailorcrane/name:tag, 还可以指定registry.
                                        # example: docker pull myregistry.local:5000/testing/test-image
                                        # example: docker pull registry.access.RedHat.com/rhel7/pod-infrastructure

alias dpu="sudo docker push"            # dpu  sailorcrane/test:tag

alias dps="sudo docker ps -a"                      # dps (show all container_id)   list images
alias dpsg="sudo docker ps -a | env grep --color"  # dpsg  mongodb
alias dpsf="sudo docker ps --no-trunc"             # dpsf : show full command
alias dim="sudo docker images"                     # dim  ubuntu:14.04             list containers
alias dimg="sudo docker images | env grep --color" # dimg mongodb
alias dpsq="sudo docker ps -a  -q"                 # --quiet
alias dimq="sudo docker images -q"                 # --quiet


alias dsta="sudo docker start"           # dst  image (image ------> container)
alias dstp="sudo docker stop"           # dst  image (image ------> container)
alias dat="sudo docker attach"          # dat  id(name)

alias drun="sudo docker run"             # dru  ubuntu:14.04 echo 'good' (image ------> container)
alias drunit="sudo docker run -it"       # druit  ubuntu:14.04 bash (/bin/bash)
alias drunitd="sudo docker run -itd"     # run detach interactive tty
                                        # 注意指定命令运行: docker image运行只支持路径执行文件运行.
                                        # 不支持命令参数. 所以要运行的东西要放在脚本中.
alias dre="sudo docker restart"        # dre container_name/id
alias drst="sudo docker restart"       # drst container_name/id

alias dhis="sudo docker history"             # view history of image layer

alias dexe="sudo docker exec -it"          # dexe <container_name> /bin/sh :NOTE 注意<container> 和 命令顺序
alias dexec="sudo docker exec -it"         #


alias dtag="sudo docker tag"             # dta  ubuntu:14.04  crane_ubuntu(crane_ubuntu as alias)
alias din="sudo docker inspect"         # din  ubuntu:14.04

# search filter out '/' (only official image)
#dse5 django | ack --nocolor '^[^/]*\s+'
# alias dsehub=""
alias dse="sudo docker search"          # dse nginx; dse  sailorcrane
alias dse5="sudo docker search --filter=stars=5"   # dse5 ubuntu
alias dse0="sudo docker search --filter=stars=10"   # dse0 ubuntu

alias drmi="sudo docker rmi"            # drmi sailorcrane/ubuntu:14.04(delete image)

# 删除<none> 标签的images

drmin() {
    # 不好做alias, alias不太支持嵌套$(), 或者``
    sudo docker rmi $(sudo docker images | env grep '<none>' | awk '{print $3}')
}

alias drmc="sudo docker rm"             # drmc container_id    (delete container)
alias drmcf="sudo docker rm -f"         # force rm container: docker如果没有停止, 只能先停止再正常删除, 或者强制删除!

alias dsa="sudo docker save -o"         # dsa ubuntu14.tar ubuntu:14.04 : image ------> file
alias dlo="sudo docker load --input"    # dlo ubuntu14.tar              : file  ------> image

alias dex="sudo docker export"          # dex   container_id ubuntu.tar  : container ---> file_name
alias dimp="sudo docker import"         # dimp  ubuntu.tar ubuntu:1.0    : file ------>  image_name
alias dimp-="sudo docker import -"      # dim-  image_name, import from standard output
#alias dlo="sudo docker load <"         # dlo ubuntu14.tar

# 拷贝其它服上的image
# 1: dsa ubuntu14.tar ubuntu:14.04
# 2: dimp ubuntu14.tar

# alias dmount="sudo docker import -"      # dim-  image_name, import from standard output
docker_view_mount() {
    Container=$1

    # grep
    # sudo docker inspect $Container | env grep '"Mounts"' -w -A 50

    # perl
    # 从"Mounts"开始, 到"Config"结束
    sudo docker inspect $Container | perl -lne 'print if /"Mounts"/ .. /"Config"/'
}

alias dmount="docker_view_mount"


#need function docker-enter
alias docker-pid="sudo docker inspect --format {{.State.Pid}}"
alias nsenter-pid="sudo nsenter   --uts --pid --net --mount --ipc --target"

denter() {
    # NOTE: 用法如下: 跟上容器名字
    USAGE="denter first-mysql"
    name=$1
    shift 1
    PID=$(sudo docker inspect --format {{.State.Pid}} $name)

    # $* 用来指定 sh, bash等命令, 有些容器没有bash, 只能通过nsenter sh进入
    # NOTE: 这里先尝试bash(默认), 失败后再使用sh(sh一般container都支持)
    # NOTE: 'sh'没有自动补全功能
    if ! sudo nsenter   --uts --pid --net --mount --ipc --target $PID; then
        echo "will use /bin/sh as container shell"
        sudo nsenter   --uts --pid --net --mount --ipc --target $PID 'sh'
    fi
}
alias den="denter"



dpid() {
    Container=$1
    sudo docker inspect  -f '{{.State.Pid}}'  $Container
}

dlogf() {
    Container=$1

    # 1: 如果容器停止了, 查看最后10条日志.
    # 2: 如果容器日志一直在写, 可以持续跟踪日志.
    # docker logs -f --tail 10 container_name       # 这个命令的效果呢?
    sudo docker logs -f $Container --tail 10
}

# dmount() {
#     Container=$1
#     ls
# }

# =================== docker net =====================
# 创建docker网络, 并使用
# alias docker-net-ls="sudo docker network ls"
# alias docker-net-create="sudo docker network create --subnet=172.18.0.0/16 mynet"
# alias docker-net-use="sudo docker run --net mynet --ip 172.18.0.22 --name my-busy -itd busybox"

# docker net ls/create/use/rm
NET_NAME="mynet"
NET_RANGE="172.18.0.0"
NET_IP="172.18.0.22"
alias dnl="sudo docker network ls"
alias dnc="sudo docker network create --subnet=${NET_RANGE}/16 ${NET_NAME}"
alias dnu="sudo docker run --net ${NET_NAME} --ip ${NET_IP} --name ip-busy -itd busybox"        # network use
alias dnr="sudo docker network rm"


# =================== docker volume =====================
alias dvc="docker volume create --name DataVolume1"

# NOTE: container mount volume
# docker run -ti --rm -v DataVolume1:/datavolume1 ubuntu

# =================== docker iptables =====================
alias dipt="sudo iptables -vnL | env grep docker -i -C 20 --color"

# NOTE: WARNING docker可以访问host的局域网ip, 但不能访问本地host, 添加如下iptables INPUT规则
# iptables -t filter -I INPUT -s 172.17.0.0/24 -j ACCEPT  # NOTE: 使得本地host接受docker0 进入的流量, 这里把172.17.0.0/24改成docker0网卡应该也可以

