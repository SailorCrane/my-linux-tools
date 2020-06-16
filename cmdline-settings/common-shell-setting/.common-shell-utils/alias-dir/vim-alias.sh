
# =================== vim + gvim =====================
alias gvm="gvim -u NONE -c 'source ~/.vimrc'"
alias gv="gvim"
#alias vi="vim"

# =================== profile vim start file =====================
vim_time_file="/tmp/vim-start.txt"
# vim --startuptime 第一个文件指定start时间日志位置, 第二个文件为要编辑的文件
# 先打完启动时间日志, 再编辑
# 但是注意: 指定txt和py文件启动时间肯定不同
# vis: startuptime
alias vis="rm -rf ${vim_time_file}  &&  vim --startuptime ${vim_time_file}  ${vim_time_file}"
alias gvis="rm -rf ${vim_time_file}  && gvim --startuptime ${vim_time_file}  ${vim_time_file}"

alias vid="sudo visudo"     # visudo, edit /etc/sudoers


# =================== quick file =====================
#alias vig="git config -e --global"         # 系统git设置
# 项目git config文件, 每次git dir都不同, 所以使用eval实现延迟执行
# 参考rok的实现
#alias viG='eval vim "$""(git dir)"/.git/config'
#alias via="vim ~/.common-shell-utils/myAlias.sh"
alias via="vim ~/.common-shell-utils/alias-dir/aaa-basic-alias.sh"
alias vin="vim -u NONE"                             # bare vim run
alias viu="vim -u ~/.vim/vim-scripts/essential.vim" # vimbare + essential
alias vig="git config -e --global"                  # 系统git设置: ~/.gitconfig
alias viG="git config -e --local"                   # 项目./git/config
alias vib="vim ~/.bashrc"
alias viv="vim ~/.vimrc"

# =================== vikey =====================
# 记录vim按键
alias vikey="vim -w vikey_.txt"
