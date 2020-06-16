# vim: set foldmethod=marker  foldlevel=0:

# 2-2: cd  develop  dir
alias mktests="mkdir -p test{1..10}"       # mkdir test1, test2, test3...
alias mdb="mkdir -p build"
alias cdt="cd test"
alias cdb="cd build"
#alias cds="cd source"   # now cds is a function for "cd src" or "cd source"

# 2-3: cd  home/subdir
alias cdh="cd ~"                 # cd home
alias cdd="cd ~/Downloads/"
alias cdD="cd ~/Desktop/"
alias cdS="cd ~/Share-With-Windows"
alias cdv="cd ~/.vim/"           # 快速进入vim配置目录

# 2-4: cd parent dir
alias cdp="cd ../"
alias cd1="cd ../"
alias cd2="cd ../../"           # 不要cd ../ && cd ../  这样执行两次cd, 无法使用cd - (cd-)返回原目录
alias cd3="cd ../../../"
alias cd4="cd ../../../../"
alias cd5="cd ../../../../../"
alias cd6="cd ../../../../../../"
alias cd7="cd ../../../../../../../"
alias cd8="cd ../../../../../../../../"
alias cd9="cd ../../../../../../../../../"
alias cd0="cd ../../../../../../../../../../"
alias cdr="cd /"            # cd root


alias ..="cd  ../"
alias .1="cd  ../"
alias .2="cd  ../../"           # 不要cd ../ && cd ../  这样执行两次cd, 无法使用cd - (cd-)返回原目录
alias .3="cd  ../../../"
alias .4="cd  ../../../../"
alias .5="cd  ../../../../../"
alias .6="cd  ../../../../../../"
alias .7="cd  ../../../../../../../"
alias .8="cd  ../../../../../../../../"
alias .9="cd  ../../../../../../../../../"
alias .0="cd  ../../../../../../../../../../"       # 0表示10

alias cd-"=cd -"
alias cde="cd /etc"

alias .-="cd  -"
alias .e="cd  /etc"
alias .r="cd  /"            # cd root


# test dir
alias mytest="cd ~/test"         # 进入test/
alias mytestc="cd ~/test/c"      # 进入test/c
alias mytestcpp="cd ~/test/c++"  # 进入test/c++
alias mytestj="cd ~/test/java"   # 进入test/java
alias mytestp="cd ~/test/python" # 进入test/python

alias mytestb="cd ~/test/bash"   # 进入test/bash
alias mytestz="cd ~/test/zsh"    # 进入test/zsh

alias mytestv="cd ~/test/vim"    # 进入test/vim
alias mytestg="cd ~/test/git"    # 进入test/git

alias mytestd="cd ~/test/django"    # django

# local file system directory: not test dir
alias myhome="cd ~"              # 进入home/
alias mydown="cd ~/Downloads"    # 进入Download
alias mypict="cd ~/Pictures/"    # 进入Download
alias mytmp="cd /tmp"            # 进入tmp
