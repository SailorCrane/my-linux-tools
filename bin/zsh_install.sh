#! /bin/bash
#
# zsh_install.sh
# Copyright (C) 2017 crane <crane@crane-pc>
#
# Distributed under terms of the MIT license.
#

True=0
False=1

.  "./aaa_base_function.sh"      # source 路径

hasZsh() {
    # 判断系统中是否有zsh
    if  which zsh >> /dev/null  2>&1 ; then
        return $True
    else
        return $False
    fi
}

cross_platform_install() {
    if is_ubuntu; then
        sudo apt-get install -y $@
        return
    fi

    if is_redhat; then
        sudo yum install -y $@
        return
    fi

    echo "!!!!! Do not recognise Linux-platform: !!!!!"
    cat /etc/os-release
}

install_zsh() {
    # 如果没有zsh, 要安装zsh
    if ! hasZsh; then
        echo "Will to install zsh!"
        # sudo apt-get install zsh -y
        cross_platform_install zsh
    else
        echo "Already has zsh, skip install step!"
    fi
}

set_zsh_default() {
    # 设置zsh 为默认shell
    # chsh -s /bin/zsh

    TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
    if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then

        if hash chsh >/dev/null 2>&1; then
            # If this platform provides a "chsh" command (not Cygwin), do it, man!
            echo  "Time to change your default shell to zsh!"
            echo  "if You don\'t like zsh, then please run: \'chsh -s /bin/bash\'"

            chsh -s $(grep /zsh$ /etc/shells | tail -1)
        else
            # Else, suggest the user do so manually.
            printf "I can't change your shell automatically because this system does not have chsh.\n"
            printf "${BLUE}Please manually change your default shell to zsh!${NORMAL}\n"
        fi
    fi

}

install_zsh
set_zsh_default
