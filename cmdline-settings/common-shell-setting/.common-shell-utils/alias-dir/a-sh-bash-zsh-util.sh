
# 1-5 alias rok: return error code
# alias rok="echo $?"     # rok stand for "run OK"?
# alias 制作的rok, 不能起作用, 因为每次source后
# alias rok=echo $?
# 就变成了 alias  rok=echo 0
# alias 信息里就不再包含 $?

# 那么就增加一层间接性, 使用INDIRECT表示"?", 这样第一次变量替换, $INDIRECT 被替换成了?
# alias rok = echo  '$''$INDIRECT'
# 再加上 eval, 进行第二次替换
# 可以使用alias rok, 或者 type rok 查看rok
# type rok
# rok is aliased to `eval echo '$''?''

# 方式1: 增加变量, 先使用一次bash变量替换
#ROK_INDIRECT=?  &&  alias rok="eval echo '$'$ROK_INDIRECT"     # rok stand for "run OK"?

# 方式2: 用"'"分割 "$" 和 "?"
#alias rok="eval echo '$'?"     # bash可以, 但是不支持zsh.  zsh  eval echo '$'? 出错
alias  rok='eval echo "$""?"'    # zsh 支持.  zsh  eval  echo "$""?"   可以执行
alias  pid="echo $$"
alias ppid="echo $PPID"          # 每次shell执行时, 更新, 然后不变.
alias newzsh="exec zsh"
alias newbash="exec bash"
