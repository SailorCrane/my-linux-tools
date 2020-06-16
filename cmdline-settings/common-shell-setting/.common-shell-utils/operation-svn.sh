
svn_update() {
    # 用于git和svn协同工作时
    # 在非master分支中, 不能svn update


    # NOTE: 函数命名为'sp'会影响svn在命令行提示, 但是alias可以命名为sp
    Ope='svn update'
    if ! is_git_dir; then
        eval $Ope
        return
    fi

    branch=$(gitCurrentBranch)
    if [ "$branch" = 'master' ]; then
        eval $Ope
        return
    else
        failureMsg '在非"master"分支中不可以svn update, 请"git checkout master"后再行update'
    fi
}
alias sp=svn_update
