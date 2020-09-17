# vim:set foldmethod=marker  foldlevel=0: vim modeline

# gitd
# 当前提交HEAD为前0次提交
# 前0次的修改: 就是前1次基础上, 前0次(HEAD) 做了什么修改
# 前N 次修改: 就是前 N + 1基础上, 前N次,做了什么修改
gitd()
{
    # {{{
    # example: gitd
    gitDiffOpe="git diff"
    if [[ $@ == *'-w'* ]]
    then
        gitDiffOpe="git diff --word-diff"
        shift
    fi

    if [ $# -eq 0 ]
    then
        eval $gitDiffOpe HEAD~1  HEAD
        return
    fi

    # example: gitd  2
    # git diff HEAD~3 HEAD~2
    local beforeCi
    local currentCi
    if [ $# -eq 1 ]
    then
        currentCi=$1
        #let beforeCi=${currentCi}+1
        (( beforeCi=${currentCi}+1 ))

        echo "==============================================="
        echo $gitDiffOpe "HEAD~"${beforeCi} "HEAD~"${currentCi}
        echo "==============================================="
        echo

        # zsh 需要eval, bash不需要
        eval $gitDiffOpe "HEAD~${beforeCi}"  "HEAD~${currentCi}"
        return
    fi

    # 最好$1 > $2
    # example: gitd  5  3
    # git diff HEAD~5 HEAD~3
    # git diff beforeHead currentHead
    if [ $# -eq 2 ]
    then
        beforeCi=$1
        currentCi=$2

        echo "==============================================="
        echo $gitDiffOpe "HEAD~"${beforeCi} "HEAD~"${currentCi}
        echo "==============================================="
        echo

        eval $gitDiffOpe "HEAD~"${beforeCi} "HEAD~"${currentCi}
        return
    fi

    #
    echo Usage1: gitd
    echo Usage2: gitd "<HEAD~N>"
    echo Usage3: gitd "<HEAD~previout>"  "<HEAD~newer>"
    # }}}
}

gitdw()
{
#{{{
    #gitd $* --word-diff
    # -w 只能放在版本数字之前(用于shift)
    gitd -w $*
#}}}
}

#giti  add file to .gitignore
giti()
{
    # {{{
    UsageMsg='giti  <file or dir>'

    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    #for i in $*
    for i in $@
    do
        echo $i >> .gitignore
    done
    # }}}
}

# get current branch name of git
gitCurrentBranch()
{
    # git describe --contains --all HEAD 这两个命令都可以
    git symbolic-ref --short -q HEAD
}

# git path相关的
git_top_path()
{
    git rev-parse --show-toplevel
}

cdg()
{
    cd $(git rev-parse --show-toplevel)
}

cdgitroot()
{
    cd $(git rev-parse --show-toplevel)
}

git_dot_git_path()
{
    # (git rev-parse --show-toplevel)  +  ".git"        # 也可以
    git rev-parse --git-dir
}

git_local_config_path()
{
    DOT_GIT_PATH=$(git_dot_git_path)
    echo $DOT_GIT_PATH/config
}

# 添加远程版本库, 并且提交当前git到远程版本库
# example1: gitRemoteAndPush  https://github.com/SailorCrane/tools-setting-linux.git  github
gitRemoteAndPush()
{
    # {{{
    UsageMsg='gitRemoteAndPush  <gitRepoName>  <remote repo addr>\nExample: gitRemoteAndPush origin  <"http://github.com/..."'
    UsageMsg='gitRemoteAndPush [origin] <remote repo addr>'

    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi


    local  repoName=$1
    local  repoAddr=$2
    if (( $# == 1)) ; then
        # 默认使用origin remote name
        repoName="origin"
        repoAddr=$1
    else
        repoName=$1
        repoAddr=$2
    fi

    echo "will add remote [$repoName]"

    # step 1: and remote repo
    if ! git remote add  $repoName  $repoAddr; then
        echo "git remote add failed"
        return -1
    fi

    # step 2: get current branch name
    local  repoBranch=$(gitCurrentBranch)

    # step 3: push
    git push $repoName $repoBranch

    # }}}
}

git_is_clean()
{
    test -z "$(git status --porcelain)"
}

# 是否处于git项目中(子目录也可以, 通过git log判断)
is_git_dir()
{
#{{{
   #test -z "$(git log -1 --oneline)"
    if git log -1 --oneline >> /dev/null 2>&1; then
        return 0
    else
        return -1
    fi
#}}}
}

# 将当前分支推到oschina仓库相应分支
#alias "gitpo=git push  oschina master"  # oschina 远程仓库, 要命名为oschina才能用这条alias
#alias "gitpg=git push  github  master"  # github的远程仓库, 要命名为github才能用
gitpo()
{
    # {{{
    local curBranch=$(gitCurrentBranch)
    git push oschina  ${curBranch} $@
    # }}}
}

gitssho()
{
    # {{{
        CONFIG_PATH=$(git_local_config_path)
        # oschina git
        # url = git@gitee.com:SailorCrane/some
        # url = https://gitee.com/SailorCrane/some
        # 这里使用"#"作为分割符, 因为正则中既有"@," 又有"/".
        sed -i -r  "s#https:\/\/gitee.com\/SailorCrane#git@gitee.com:SailorCrane#"  ${CONFIG_PATH}
    # }}}
}

githttpso()
{
    # {{{
        CONFIG_PATH=$(git_local_config_path)
        # oschina git
        # url = git@gitee.com:SailorCrane/some
        # url = https://gitee.com/SailorCrane/some
        # 这里使用"#"作为分割符, 因为正则中既有"@," 又有"/".
        sed -i -r  "s#git@gitee.com:SailorCrane#https:\/\/gitee.com\/SailorCrane#"  ${CONFIG_PATH}
    # }}}
}

gitsshg()
{
    # {{{
        CONFIG_PATH=$(git_local_config_path)
        # github git
        # url = https://github.com/SailorCrane/some
        # url = git@github.com:SailorCrane/some
        sed -i -r  "s#https:\/\/github.com/SailorCrane#git@github.com:SailorCrane#"  ${CONFIG_PATH}
    # }}}
}

githttpsg()
{
    # {{{
        CONFIG_PATH=$(git_local_config_path)
        # github git
        # url = https://github.com/SailorCrane/some
        # url = git@github.com:SailorCrane/some
        sed -i -r  "s#git@github.com:SailorCrane#https:\/\/github.com/SailorCrane#"  ${CONFIG_PATH}
    # }}}
}

gitpof()
{
    # {{{
    gitpo -f
    # }}}
}

gitpg()
{
#{{{
    local curBranch=$(gitCurrentBranch)
    git push github ${curBranch} $@
#}}}
}

gitpgf()
{
#{{{
    gitpg -f
#}}}
}


# 从上上游更新(即fork的地方)
gitForkSync()
{
#{{{
    git remote update upstream && \
    git rebase upstream/master
#}}}
}

gitAddEmptyDir()
{
#{{{
    UsageMsg='gitAddEmptyDir <dir>'

    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    for i in $*
    do
        local gitDir=$(addBackSlash $i)     # addBackSlash make gitDir end with "/"
        local gitDirKeep="$gitDir/.gitkeeper"
        touch $gitDirKeep
        git add -f $gitDirKeep
    done
#}}}
}

gitup()
{
#{{{
    UsageMsg='gitup <num>'

    # if ! ParaUsage "${UsageMsg}" 0 $* ; then        # if 可以直接判断命令执行结果
    #     return -1
    # fi
    if [ $# -gt 1 ]; then
        failureMsg $UsageMsg
        return -1
    fi

    if [ $# -eq 1 ]; then
        nums=$1
    else
        nums="1"
    fi

    git reset HEAD~${nums}
#}}}
}


# 如果一个文件的stage/cache也更新了, 但没有提交, 可以使用gitrestore恢复.
gitrestore()
{
#{{{
    # restore a file to disk
    UsageMsg='grestore <file>'

    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    file_name=$1

    # reset ------> (same with reset --soft), only change stage(cache)
    # reset    : restore stage
    # checkout : restore local disk
    git reset HEAD $file_name && git checkout $file_name
#}}}
}

#gitcb()
gitamend()
{
#{{{
    # check git status, if is clean, do nothing
    if git_is_clean ; then
        #echo 'current repo is clean, do nothing'
        echo 'current repo is clean, going to change commit log'
        git commit --amend
        return 0
    fi

    if [[ $# -gt 0 ]]; then
        # has <files> and <dir> para
        echo $@
        git add $@      # no effect of submodule
    else
        git add -u
    fi

    #alias.cb=commit --amend -v
    #git commit --amend -v -m ""     # amend commit, use before message
    git commit --amend -v --no-edit  # amend commit, use before message
#}}}
}
alias gitcb="gitamend"


# drop local commit, point to same with remote 'origin'
git_drop_local_commit()
{
#{{{
    local CUR_BRANCH=$(gitCurrentBranch)
    git reset --hard origin/${CUR_BRANCH}
#}}}
}

git_remove_commits()
{
    # 对齐 remote origin分支
    local CurBranch=$(gitCurrentBranch)
    local Remote=origin
    git reset --hard $Remote/$CurBranch
}
