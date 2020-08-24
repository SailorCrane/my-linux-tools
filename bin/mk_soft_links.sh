#!/bin/bash
# vim:set fdm=marker  fdl=0: vim modeline


# toolsHome=$(readlink -f ../cmdline-settings)    # 用变量代表上层目录, 绝对路径
toolsHome=$(realpath ../cmdline-settings)    # 用变量代表上层目录, 绝对路径

# add function link dir
link_dir() {
    srcDir=$1
    destDir=$2

    #if [ ! -d ~/.subdir ]; then
    # 如果存在~/.subdir/, ~/.subdir是个目录.
    # 重复执行当前脚本, 下次会将软链接放入~/.subdir之下.
    # 所以这里检测是否存在文件, 不存在再执行ln命令, 并输入OK
    if [ -d $destDir ]; then
        echo "link_dir: failed to create symbolic ${destDir} : dir exists"  1>&2
        return
    fi

    if [ ! -d $srcDir ]; then
        echo "link_dir: failed to create symbolic for ${srcDir} : source dir doesn't exists"  1>&2
    fi

    ln -s ${srcDir}  ${destDir}
}


sudo_link_dir() {
    srcDir=$1
    destDir=$2

    #if [ ! -d ~/.subdir ]; then
    # 如果存在~/.subdir/, ~/.subdir是个目录.
    # 重复执行当前脚本, 下次会将软链接放入~/.subdir之下.
    # 所以这里检测是否存在文件, 不存在再执行ln命令, 并输入OK
    if [ ! -d $destDir ]; then
        sudo ln -s ${srcDir}  ${destDir}
    else    # link dest dir exists
        echo "link_dir: failed to create symbolic ${destDir} : dir exists"  1>&2
    fi
}


LocalCustom="local-custom.sh"
# 1: bash-setting/profile/下的软链接设置
# {{{
    myprofdir=".myProfile.d"
    homeProfDir=${HOME}/${myprofdir}

    link_dir  ${toolsHome}/profile-setting/${myprofdir}  ${homeProfDir}
    touch ~/${myprofdir}/${LocalCustom}
# }}}

# 2: common-shell-setting
#{{{
    common_dir=".common-shell-utils"
    homeSubdir="${HOME}/${subdir}"
    link_dir  ${toolsHome}/common-shell-setting/${common_dir}  ~/${common_dir}

    env echo -e "\n------------------- custom-no-git create ---------------------"
    # echo "touch ~/${common_dir}/*custom-no-git*"
    touch ~/${common_dir}/${LocalCustom}           # 此脚本仅仅包含针对当前主机的东西(所以不加入版本控制)
    touch ~/${common_dir}/bin/${LocalCustom}       # bin下的脚本, 不加入版本控制
    touch ~/${common_dir}/alias-dir/${LocalCustom} # alias下的脚本, 不加入版本控制
#}}}

# 2: bash-setting/subdir/下的软链接设置
# {{{
    subdir=".bash-utils"
    homeSubdir="${HOME}/${subdir}"

    link_dir  ${toolsHome}/bash-setting/${subdir}  ${homeSubdir}
# }}}

# 3: .zshrc + .oh-my-zsh/软链接设置
# {{{
    ln  -s        ${toolsHome}/zsh-setting/.zshrc       ~/.zshrc
    link_dir      ${toolsHome}/zsh-setting/.oh-my-zsh   ~/.oh-my-zsh
    link_dir      ${toolsHome}/zsh-setting/.zsh-utils   ~/.zsh-utils
# }}}

# 4: mess setting: (tmux, Xmodmap, git, gdb, pylintrc)
#{{{

    # tmux and tmux local create
    ln  -s  ${toolsHome}/tmux-setting/.tmux.conf      ~/.tmux.conf

    TMUX_GLOBAL=".tmux_local_template.conf"
    TMUX_LOCAL=".tmux_local.conf"
    env echo -e  '\n------------------- tmux ---------------------'
    echo ${toolsHome}/tmux-setting/${TMUX_GLOBAL}
    echo ${toolsHome}/tmux-setting/${TMUX_LOCAL}
    cp     ${toolsHome}/tmux-setting/${TMUX_GLOBAL}    ${toolsHome}/tmux-setting/${TMUX_LOCAL}
    ln -s  ${toolsHome}/tmux-setting/${TMUX_LOCAL}     ~/${TMUX_LOCAL}

    # xmodmap setting
    ln  -s  ${toolsHome}/xmodmap-setting/.Xmodmap     ~/.Xmodmap
    ln  -s  ${toolsHome}/xmodmap-setting/.Xmodtoggle  ~/.Xmodtoggle

    # git setting
    ln  -s  ${toolsHome}/git-setting/.gitconfig       ~/.gitconfig
    ln  -s  ${toolsHome}/git-setting/.gitignore       ~/.gitignore

    # gdb setting
    ln  -s  ${toolsHome}/gdb-init-setting/.gdbinit    ~/.gdbinit

    # pylintrc
    ln  -s  ${toolsHome}/pylint-setting/.pylintrc    ~/.pylintrc


#}}}

# 5: svn: 因为如果subversion没有安装的话, 不存在 ~/.subversion/目录
# {{{

    # svn setting
    SvnDir=$HOME/.subversion

    if [ -d ${SvnDir} ]; then
        ln  -s  ${toolsHome}/svn-setting/.config   ${SvnDir}/config
    else
        echo "Doesn't exist ${SvnDir}"
    fi

# }}}

    # 6: firefox vimperatorrc插件配置 软链接恢复.
    ln  -s  ${toolsHome}/vimperator-setting/.vimperatorrc   ~/.vimperatorrc

    # 7: .ack 软链接设置
    ln  -s   ${toolsHome}/ack-setting/.ackrc       ~/.ackrc

    # 8: deb/ubuntu/mint based source-list
    # 必须放到 /etc/apt/sources.list.d/中才管用
    #env echo -e "\n------------------- 注意 /etc/apt/crane-source-list.d/ 是Ubuntu 16.04 xenial的源 ---------------------"
    env echo -e "\n------------------- Ubuntu源 ---------------------"
    echo '注意 /etc/apt/crane-source-list.d/ 是[Ubuntu 16.04] xenial的源'
    #mk_git_init  /etc/apt/  "init"
    sudo_link_dir ${toolsHome}/apt-source-setting/crane-source-list.d   /etc/apt/crane-source-list.d

    # pip/pip.conf
    sudo_link_dir ${toolsHome}/pip-setting/pip  ~/.config/pip

    # ssh
    sudo_link_dir ${toolsHome}/ssh-setting/config       ~/.ssh/config
    chmod 600 ~/.ssh/config
