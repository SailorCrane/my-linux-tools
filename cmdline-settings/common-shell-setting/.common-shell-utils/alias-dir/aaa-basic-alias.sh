# vim: set foldmethod=marker  foldlevel=0:

# 1-1 quick command
# 这里的折叠是嵌套折叠, 有两层
# {{{
# 系统的~/.bashrc中自带了一些ls 的alias, 和 grep的alias
# 只要是myAlias.sh 中没有的alias, 但是bash中却存在的
# 都可以去~/.bashrc 中查找是否设置了
alias  c="clear"
alias  h="history"
alias jl="jobs -l"
alias  m="man"
alias al="alias"        # al stand for "alias list", to show all alias
alias un="unalias"
alias una="unalias -a"  # clear all alias

alias so="source"               # 其实没有必要"."已经够简短了
#alias sb="source ~/.bashrc"
alias sf="source ~/.profile"
alias ba="bash"

alias time="/usr/bin/time -p"
alias help="help -m"            # 使用man-like 格式输出帮助
alias hashclear="hash -r"       # 清除对于命令的hash: 如果调用某命令, 移动命令可执行文件到别的路径.
                                # 因为hash无法找到, 所以会出错. 这时候hash -r 清除hash即可
                                # -r stand for remember

# 列出僵尸进程
#alias lz="ps aux | grep -v grep |  grep Z"             # list zombie
#alias grep="ack"
alias lz="ps aux | grep -v grep |  grep defunct"        # list zombie

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime='now'                 # time
alias nowdate='date +"%d-%m-%Y"'    # date

alias level='runlevel'

alias hn='hostname'

if ! env which whatis >/dev/null 2>&1 ; then
    alias whatis="env man -f"
fi

# }}}

# 17 terminal show pts/num
alias terminal=tty      # 如果使用lsof + ps + grep 搜索到某个进程id 占用的tty, 就可以循环使用tty或者terminal查看终端的虚拟终端号


# 21 privilege
alias root="sudo -s"        # 切换到root
alias sul="su -l"         # switch and login(use new user's env)

# 22 signal
alias signal="kill -l"      # 列出所有信号

# 26 restart software/service
#{{{
alias guakere="pkill python2 && nohup guake &"   # guakerestart
alias keyre="sudo dpkg-reconfigure keyboard-configuration"
alias nre="sudo service network-manager restart"
alias xre="xrandr -s 1920x1080"
#}}}

# Centos(Redhat) network restart
#alias  nre="service network restart"

# 27 show fun definition
alias fun="declare -f"      # bash + zsh work
alias func="declare -f"      # bash + zsh work

# 28 node-js
alias js=nodejs

# 29 which -a
alias wh="type -a"
#alias wh="which"
# alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'      # bash
alias which="which -a"      # zsh



# 30 browser alias
alias  ff=firefox
alias  chrom=chromium-browser


# 31 chown为当前用户. chc means chown current.  chcr stand for chown recursive.
# 既然要修改owner为当前用户, 那么说明之前owner不是当前用户. 需要sudo
alias chc="sudo chown $(whoami):$(whoami)"
alias chcr="sudo chown $(whoami):$(whoami) -R"

# 32 term
alias term="gnome-terminal"


# 39 sha1 map string
alias sha1="openssl sha1"

# 40 exec/object
#{{{
# strip, nm, readelf, objdump, strings, size
alias showb="dpkg -L binutils | ack "bin/""

# nm stand for 'name'
alias symbol="nm"     # show object symbol(names): .o, .a, .so, executable
alias nmd="nm -D"     # show Dynamic symbol, not regular symbol, like readelf -s

alias nmc="strip"     # nm clear: clear object symbol(regular symbol)
alias nmcd="strip -d" # clear debug flag
#}}}

# 45 desktop paper
# for mint cinnamon
alias paper="gsettings set org.cinnamon.desktop.background picture-uri  \"file:///filename\""
# gsettings get org.cinnamon.desktop.background picture-opacity
# gsettings get org.cinnamon.desktop.background picture-options


# my own command(in bin/)
alias cof="color_filter"


# 51
# pkg list
# /usr/local/lib/pkgconfig : default dir
# /usr/lib/pkgconfig       : default dir
alias pkgl="pkg-config --cflags --libs"     # pkgl gtest_main


alias px="sudo pwdx"     # px 3359, 查看pid工作目录

alias password="column -s ':' -t /etc/passwd"
