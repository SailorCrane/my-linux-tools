# vim: set foldmethod=marker  foldlevel=0:

alias l.="ls .* -d"
alias lm="ls -la | less"
# alias ll="ls -l --color=always" # 显示详细信息, 带颜色
# alias ls="ls --color=always"    # 永远显示颜色, 这样被管道 | less -R 查看时, 不会丢失颜色
alias ll="ls -l -G " # 显示详细信息, 带颜色
alias ls="ls -G"    # 永远显示颜色, 这样被管道 | less -R 查看时, 不会丢失颜色
alias l1="ls -1"                # 每行显示一个文件
alias lst="ls -rt"              # 按时间显示文件(快速查看最近下载)
#alias ls1="ls -1 -rt"          # 每行显示一个文件

alias lsp="ls ../"
alias lsh="ls ~/"
#alias lsd="ls ~/Download/"
