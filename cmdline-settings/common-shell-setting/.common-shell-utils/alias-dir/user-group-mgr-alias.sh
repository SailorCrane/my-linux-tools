
# 41 user manage

# input passwd username
# 回头写个添加函数好了
alias usera="echo 'input passwd username' \
            && sudo useradd -m -s /bin/bash -p " # -m create home, -s shell, -p passwd
alias userd="sudo userdel"                       # -f del home dir
