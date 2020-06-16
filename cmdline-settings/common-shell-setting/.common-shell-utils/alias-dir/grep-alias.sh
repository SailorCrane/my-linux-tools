

# 18 grep 快速选项:greb, greA, grepB, grepC

# grep binary, 映射grep本身, 使得"grep"本身就支持 -a二进制 不要, 不要这样做.这样普通搜索时, 终端遇到二进制文件可能就挂了
#alias grep="grep -a --color"

# alias greb="grep --binary-files"
#alias grea="grep -a --color"    # 因为选项是-a, 所以也alias为grea, 所以greb=grea


alias grep="grep --color=always"   # 永远显示颜色, 这样被管道 | less -R 查看时, 不会丢失颜色
alias greo="grep -o"               # --only-matching, 只对"匹配到的内容"进行输出
alias greb="grep -a --color"       # grep binary

alias grepA="grep -A 5 --color"    # 查看后5行
alias grepB="grep -B 5 --color"    # 查看前5行
alias grepC="grep -C 5 --color"    # 查看前后5行, context
alias grepL="grep -Pzo"            # cross line search

alias grepl="grep --line-buffered" # 在读取"流式数据" + "重定向输出"的时候使用, 把匹配到的内容快速"flush"到重定向目的处
