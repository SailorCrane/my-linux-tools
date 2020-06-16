
# HINT: Ubuntu没有alternatives,
# HINT: 只有update-alternatives + galternatives(GUI)
# HINT: alternatives都通过/etc/alternatives/目录存放
# HINT: alternatives config信息存放在 /var/lib/dpkg/alternatives/中

# HINT: "update-alternatives"命令来自"dpkg"包: dpkg ===> update-alternatives

if ! env which 'alternatives' >/dev/null 2>&1 ; then
    #echo 'Bad, has no alternatives in /usr, use update-alternatives ack'
    alias alternatives="update-alternatives"
fi

alias alts="alt --get-selections"      # alt show
alias alt="alternatives --config"      # 设置: alt vim/java


# update-alternatives 是dpkg的一个功能, 通过读取 /var/lib/dpkg/alternatives/ 实现
# 是通过trace 跟踪系统调用, 发现数据库文件的
