# vim: set foldmethod=marker  foldlevel=0:

alias   tm="tmux"
alias   tmc="tmux new -s"

alias   tma="tmux attach  -t"
# alias   tmac="tmux attach  -t  my-tools -c /tmp/tmp"      # attach and change root directory

#alias   tmd="tmux kill  -t"
alias   tmk="tmux kill-session  -t"
alias  tmka="tmux kill-server"

#alias   tmls="tmux ls"
alias   tml="tmux ls | cat -n"
alias   tmln="tmux ls | grep -v attach | cat -n"         # 列出没有attach的tmux session
alias   tmla="tmux ls | grep attach | cat -n"            # 列出 已经attach的tmux session

alias   tmn="tmux display-message -p '#S'"            # 当前tmux的名字
