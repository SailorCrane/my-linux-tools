
docker run  --name nc1 -itd mync
docker run  --name nc2 -itd mync

docker run  --privileged=true --name ha1 -itd  myhaproxy       # 第一个haproxy
docker run  -v `readlink -f ./config_keepalived_d2.conf`:/etc/keepalived/keepalived.conf --privileged=true --name ha2 -itd  myhaproxy        # 第二个haproxy
