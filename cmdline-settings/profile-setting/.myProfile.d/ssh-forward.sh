#! /bin/sh
#
# local-custom-router-and-ssh.sh
# Copyright (C) 2019 crane <crane@gosun>
#
# Distributed under terms of the MIT license.
#

ssh_local_forward() {
    Ope="autossh -M 0 -q -f -N -o 'ServerAliveInterval 15' -o 'ServerAliveCountMax 3' -L"

    local LocalAddr=$1       # 8081(*:8081)
    local RemoteProxyAddr=$2 # localhost:8081
    local UserAt=$3          # crane@ubuntu
    local RemotePort=$4      # 7337

    ProxyMap=$LocalAddr:$RemoteProxyAddr
    # echo $ProxyMap

    # if ps -ef | grep $LocalAddr | grep $RemoteProxyAddr | grep -v grep | grep $UserAt | grep $RemotePort >/dev/null ;
    if ps -ef | grep $ProxyMap --color=no | grep -v grep | grep $UserAt | grep $RemotePort >/dev/null ;
    then
        echo Exist "$ProxyMap $UserAt $RemotePort"
        return
    fi

    echo "Do: " $Ope $ProxyMap $UserAt -p $RemotePort
    # $Ope $ProxyMap $UserAt -p $RemotePort
    autossh -M 0 -q -f -N -o 'ServerAliveInterval 15' -o 'ServerAliveCountMax 3' -L $ProxyMap $UserAt -p $RemotePort
}


do_ssh_local_forward() {
    ssh_local_forward   localhost:8080 localhost:8080    crane@ubuntu 7337    # v2ray
    # ssh_local_forward     8081 localhost:8081    crane@ubuntu 7337    # v2ray

    ssh_local_forward   localhost:6022 10.10.100.26:22   uaq@oldjump  7000   # 预发布 ssh
    ssh_local_forward   localhost:6082 10.10.100.26:8082 uaq@oldjump  7000   # flink-web-ui

    ssh_local_forward   localhost:27017 10.10.25.53:27017  uaq@oldjump  7000   # flux50 ssh
    ssh_local_forward   localhost:8086 10.10.25.50:8086  uaq@oldjump  7000   # flux50 ssh
    ssh_local_forward   localhost:2181 10.10.25.50:2181  uaq@oldjump  7000   # flux50 ssh
    ssh_local_forward   localhost:5022 10.10.25.50:7777  uaq@oldjump  7000   # flux50 ssh
    ssh_local_forward   localhost:5082 10.10.25.50:8082  uaq@oldjump  7000   # flux50 flink
    ssh_local_forward   localhost:5083 10.10.25.51:8082  uaq@oldjump  7000   # flux51 flink

    ssh_local_forward   localhost:2380 10.10.25.230:80   uaq@oldjump  7000   # 230 nginx

    ssh_local_forward   \*:3389 10.10.25.110:3389  uaq@oldjump 7000   # windows: -u backwin01 -p 123123

    ssh_local_forward   localhost:3022 10.10.100.13:22   uaq@oldjump  7000 # 13 ssh
    ssh_local_forward   localhost:3082 10.10.100.13:8082 uaq@oldjump  7000 # 13 flink

    ssh_local_forward   localhost:3023 10.10.100.18:22   uaq@oldjump  7000 # 18 ssh
    ssh_local_forward   localhost:3083 10.10.100.18:8082 uaq@oldjump  7000 # 18 flink

    ssh_local_forward   localhost:2022 10.10.25.22:7777  uaq@oldjump  7000 # flux50 ssh
    ssh_local_forward   localhost:2082 10.10.25.22:8082  uaq@oldjump  7000 # flux50 flink
}


ssh_remote_forward() {
    # 远程端口转发: 使用远程2222访问本地2222
    local Ope="autossh -M 0 -fCNR"

    local LocalAddr=$1       # 8081(*:8081)
    local RemoteProxyAddr=$2 # localhost:8081
    local UserAt=$3          # crane@ubuntu
    local RemotePort=$3      # 7337

    if ps -ef | grep $ProxyMap --color=no | grep -v grep | grep $UserAt | grep $RemotePort >/dev/null ;
    then
        echo Exist "$ProxyMap $UserAt $RemotePort"
        return
    fi

    # autossh -M 0 -fCNR \*:2222:localhost:2222 crane@ubuntu  -p 7337
}


do_ssh_local_forward
