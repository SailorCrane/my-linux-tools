
# git@gitee.com:CraneAgain/influx-ope.git       # 按照这个模式来修改

# git tool
alias kgit="gitkraken"

# git alias
# alias gd="git diff"                 # local  ------> stage
# alias gdc="git diff --cached"       # stage  ------> HEAD
# alias gdca="git diff HEAD"          # local  ------> HEAD(gd + gdc)
alias gcl="git clone"                # no recursive
alias gclr="git clone --recursive"    # clone recursive

#di  = diff --no-index                        # 对磁盘文件上两个文件的比较,而不是历史版本的比较. 和git版本库无关
alias gd="git diff --ws-error-highlight=old"               # local  ------> stage
alias gdc="git diff --cached --ws-error-highlight=old"     # staged ------> repo
alias gdca="git diff HEAD    --ws-error-highlight=old"     # local  ------> repo(df + dc)

alias gdw='git  diff --word-diff'
alias gdwc='git diff --cached --word-diff'
alias gdwa='git diff HEAD  --word-diff'

alias gaa="git add --all :/"
alias gau="git add --update"        # git adu, only add in repo

alias gt="git status"       # 更短, 因为git status用的很多, 有必要定义一个更短的alias
#alias gitt="git status"
#alias gittt="git status"
#alias gitttt="git status"

alias gitl="git log"
alias gitl1="git log --oneline"
alias gitl11="git log --oneline -1" # 只要最近一条日志

alias gitt="git tag"

alias gmv="git mv"
#alias grm="git rm --cached"        # 危险, 不提供任何rm的alias

alias gsup="git push --set-upstream origin master"
alias gtrack_master="git branch --set-upstream-to=origin/master master"     # master ===> origin/master

# 因为用的很多, 虽然已经定义了git alias ps=push, pl=pull
# pull默认使用pull --rebase
alias gl="git pull --rebase"

# 本想用gs, 和ps, pl相对应. 但是gs已经是一个命令了
alias gp="git pull --rebase && git push"
                                    # 先pull, 再push, 神作

# 可以针对目录为参数, 写一个函数
alias gittool="git --git-dir=/mySaved/tools-setting-linux/.git  --work-tree=/mySaved/tools-setting-linux/"
alias gitmyc="git --git-dir=/mySaved/my-c-and-cpp-recall/.git  --work-tree=/mySaved/my-c-and-cpp-recall/"
alias gitvim="git --git-dir=/mySaved/vimrcBackup/.git          --work-tree=/mySaved/vimrcBackup/"

alias gitReg="git submodule update --init"

# git default branch origin/github: to origin
alias gdbo='git branch --set-upstream-to=origin/master'
alias gdbg='git branch --set-upstream-to=github/master'

alias gcm="git checkout master"     # master branch
alias gc-="git checkout -"          # previous branch
alias grbm="git rebase master"      # rebase master

# for netease git contron svn
alias gcu="git add --all && git commit -m 'update'"

# git stash push + pull + stash pop: NOTE: pull need rebase
#alias gus="git stash && git pull --rebase && git stash pop"
# A; B    # Run A and then B, regardless of success of A
# A && B  # Run B if and only if A succeeded
# A || B  # Run B if and only if A failed
# A &     # Run A in background
alias gus="git stash && git pull --rebase ; git stash pop"      # NOTE: 无论pull 是否成功, 都要stash pop, 所以用";"

#alias "git\ rm=git\ rm\ --cached"  #alias name不支持空格

# NOTE: 更新所有的子模块(foreach git pull)
#git submodule update --recursive --remote

alias git_no_filemode="git config core.fileMode false"
