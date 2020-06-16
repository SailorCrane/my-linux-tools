
#
alias se_sp='sudo setenforce 0'
alias se_st='sudo setenforce 1'
alias se_status="sestatus"

# 使用sed修改配置/etc/sysconfig/selinux 文件
alias se_disable="sed -i 's/enforcing/disabled/g' /etc/selinux/config"      # enforcing ------> disabled
alias se_enable="sed  -i 's/disabled/enforcing/g' /etc/selinux/config"      # disabled ------> enforcing
