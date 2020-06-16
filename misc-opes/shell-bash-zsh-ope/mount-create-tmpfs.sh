# mount -t [TYPE] -o size=[SIZE] [FSTYPE] [MOUNTPOINT]

sudo mount -t tmpfs -o size=512m tmpfs /mnt/myfast    # 一条命令就可以创建一个tmpfs文件系统

createTmpfs() {
    # Usage: creatTmpfs <dir>  [size( default is 500M )]

}

# 在/etc/fstab中:
# 当然在 /etc/fstab中也可以写入item: 使得开机启动tmpfs.
    # /mnt/myfast    tmpfs    defaults, size=2G    0  0   # 失败案例
    # tmpfs          /mnt/myfast    tmpfs    size=2G    0  0 # 成功案例, 在最先也有一个tmpfs关键字

# 当 defaults 存在时, size大小为内存的一半. 如果defaults, 和 size同时存在, size不起作用.

