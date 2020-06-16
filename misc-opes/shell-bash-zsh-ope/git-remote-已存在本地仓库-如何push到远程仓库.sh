# 两条指令
git remote add  origin https://git.oschina.net/CraneAgain/shared-ptr-producer-comsumer
git branch --set-upstream-to=origin/master master

# 如果忘记: 可以使用试探法, 勾出git提示.
#首先虽然没有远程仓库,但是 git push
# git 会提示没有远程仓库: 提示如下
git remote add <name> <url>
and then push using the remote name
    git push <name>

# git remote add 之后, 继续git push, 这次如果不带 远程仓库名
# git会提示设置上游分支--即默认远程分支.根据提示设置上游分支即可.
# 或者提交时, 带上仓库名
To push the current branch and set the remote as upstream, use
    git push --set-upstream origin master


# 2 添加第二个远程仓库, 并push
# 如果已经有一个默认仓库,origin仓库.比如内部gitlab部署仓库.
# 但是想在将项目传到互联网上!需要添加第二个仓库.
git  remote  add   anotherRepo   https://...    # 添加远程仓库
git  push   anotherRepo  master         # 提交到指定远程仓库的指定分支
