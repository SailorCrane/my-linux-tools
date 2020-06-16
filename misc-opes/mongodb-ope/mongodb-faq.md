
1: not master and slaveok=false
    这是正常的,因为SECONDARY是不允许读写的.解决,方法如下:
    rs.slaveOk();
