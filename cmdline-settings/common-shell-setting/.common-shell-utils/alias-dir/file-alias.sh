# vim: set foldmethod=marker  foldlevel=0:

# alias for safe: cp/mv/rm
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"


alias  n="cat -n"       # 文件行号

alias le="less -R"        # 保留 grep, ls --color 颜色
#alias let="tac | less -R" # tac/cat, let是关键字
alias len="cat -n | less -R" # number + less

alias lns="ln -s"       # 快速软链接.

alias cpr="cp -R"       # 递归拷贝目录
alias cpf="cp -f"       # --force

alias mvf="mv -f"       # --force
alias rmf="rm -rf"      # 强制删除: rm force

# rm vim swp file
#{{{
alias rms="find . -name '*.swp' \
            && eval rm -rf \"$\"\"(find . -name '*.swp')\""
#}}}

#alias mkp="mkdir -p"   # 创建层级目录, make package已经占用了map
alias md="mkdir -pv"    # 已经在.oh-my-zsh/lib/directory.zsh中定义

### alias fi="file"     # fi 时 shell关键字(if的结尾)
alias f="file"
alias fl="file -L"      # fl : --dereference, 跳过soft link, 直接解析出最终文件

# 类似于Python : os.path.realpath('path')
# alias at="readlink -f"   # 链接解析到底
alias at="realpath"   # 获取绝对路径

alias tf="tail -f"    # NOTE: "tail follow" output, 一直跟踪后续新的文件内容
alias taif="tail -f"    # NOTE: "tail follow" output, 一直跟踪后续新的文件内容
alias tailf="tail -f" # NOTE: "tail follow" output, 一直跟踪后续新的文件内容

alias uppercase="tr a-z A-Z <"
alias lowercase="tr A-Z a-z <"


alias diff="git diff --no-index"
alias diffw="git diff --no-index --word-diff"
