
#alias psg=pgrep
# ps -ef可以看到父进程号, ps aux无法看到
#alias psg='ps aux | grep -v grep | grep --color=always' # grep查看进程信息
alias psg="ps -ef | grep -v grep | grep --color=always"
alias treeg="pstree -p | grep -C 5"                 # pstree -p:show pid

alias lsofg="lsof | grep"                           # lsof

alias hg="history | grep"                           # history
alias lsg="ls | grep"                               # ls

alias alg="alias | grep"                            # alias
alias gitlg="git config --list | grep"              # git all config
alias gitag="git config --list | grep alias | grep" # git alias

alias vag="set | grep"                              # 查看搜索所有的变量
