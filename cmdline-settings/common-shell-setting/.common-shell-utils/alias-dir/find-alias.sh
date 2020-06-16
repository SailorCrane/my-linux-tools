# vim: set foldmethod=marker  foldlevel=0:

#alias  fd="find"            # 感觉没用, 很少用find
alias fin="find . -name"    # find recursive by name, 可以使用单引号在'*fname*'中防止zsh扩展*

# by empty
alias empty="find . -empty"
alias emptyd="find . -empty -type d"
alias emptyf="find . -empty -type f"

#alias swp="ls **/.*swp"      # zsh only, ls
alias swp="find . -name '*.swp'"     # 列出所有的vim *.swp文件

# by user
alias mine="find  .   -user ${USER}"
alias other="find . ! -user ${USER}"

