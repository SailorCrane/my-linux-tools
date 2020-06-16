
# mbr backup后, 就可以使用ndisasm/dasm查看响应的mbr的代码
#alias mbr_back="sudo dd if=/dev/sda of=/tmp/mbr.img bs=512 count=1"
# /tmp/mbr-2019-04-28-17:20:28.img
alias mbr_back='sudo dd if=/dev/sda of=/tmp/mbr-`date +"%Y-%m-%d-%H:%M:%S"`.img bs=512 count=1'

# alias dd_skip="sudo dd if=/etc/profile of=/tmp/tmp_skip_.txt bs=32 skip=1"      # 跳过输入文件的头32个字节
                                                                                  # bs: block size
