#! /bin/bash
# bash recognize array
# sh dont' suppport array

# vim:set fdm=marker  fdl=0: vim modeline

backupDir=./.backupSetting
# backupDir=$(readlink -f ${backupDir})   # get absolute path, used for message output

regular_back_files=(
#{{{
    # login profile
    ~/.myProfile.d

    # common shell(both bash and zsh)
    ~/.common-shell-utils

    # bash
    ~/.bash-utils

    # zsh
    ~/.zshrc
    ~/.oh-my-zsh
    ~/.zsh-utils

    ~/.ssh/config

    # tmux
    ~/.tmux.conf
    ~/.tmux_local.conf

    # xmodmap
    ~/.Xmodmap
    ~/.Xmodtoggle

    # git
    ~/.gitconfig
    ~/.gitignore

    ~/.gdbinit
    ~/.vimperatorrc
    ~/.pylintrc

    ~/.subversion/config
    ~/.ackrc

    ~/.config/pip
#}}}
    )

sudo_back_files=(
#{{{
    /etc/apt/crane-source-list.d
#}}}
    )

copyFileHere() {
#{{{
    # copy file to $backupDir
    #cp  -i $1  $backupDir -r        # -r for directory
    cp  $1  $backupDir -r        # -r for directory
#}}}
}


regular_backup_and_del() {
#{{{
    # zsh 不太支持 function  funName 这种形式定义的function
    # 所以最好写成bash 和 zsh 都支持的 funName() 这种形式

    # 创建备份目录, 使用-p选项, 即使已经存在, 也不会出错
    mkdir -p $backupDir
    fileName=$1

    # 如果存在文件的话, 备份到当前目录, 并删除
    #if [ -f "$fileName" ] ; then
    #if [ -f "$fileName" || -d "$fileName" ] ; then
    if [ -e "$fileName" ] ; then        # file exist, regular/directory/charctor device/special file
        copyFileHere $fileName
    fi

    # 这里主要是应对存在"broken link file"情况(此时test -f, test -e 都返回非0)
    if ! rm  -f  $fileName ; then
        echo '==='
        echo "can not 'rm -f ${fileName}'"
        echo '==='
    fi
#}}}
}

sudo_backup_and_del() {
#{{{
    # 创建备份目录, 使用-p选项, 即使已经存在, 也不会出错
    mkdir -p $backupDir
    fileName=$1

    # 如果存在文件的话, 备份到当前目录, 并删除
    #if [ -f "$fileName" ] ; then
    #if [ -f "$fileName" || -d "$fileName" ] ; then
    if [ -e "$fileName" ] ; then        # file exist, regular/directory/charctor device/special file
        copyFileHere $fileName
    fi

    # 这里主要是应对存在"broken link file"情况(此时test -f, test -e 都返回非0)
    sudo rm   -f  $fileName
#}}}
}

main() {
#{{{
    # backup to current dir
    rm  -rf ${backupDir}        # delete backupDir: for delete ${backupDir}/files

    for file in ${regular_back_files[@]} ; do
        regular_backup_and_del   $file
    done

    for file in ${sudo_back_files[@]} ; do
        sudo_backup_and_del   $file
    done

    env echo -e "\n------------------- backup dot files ---------------------"
    echo "backup home/ origin link files to ${backupDir} (OK)"
#}}}
}

main    # call main
