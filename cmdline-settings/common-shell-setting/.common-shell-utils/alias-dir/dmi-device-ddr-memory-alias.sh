
# alias ddr="sudo dmidecode| grep 'memory device' -i -A 10" # 查看ddr3还是ddr4
alias ddr="sudo dmidecode | grep DDR  -C 10"              # 查看ddr3还是ddr4
