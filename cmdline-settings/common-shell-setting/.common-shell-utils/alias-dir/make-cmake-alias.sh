# vim: set foldmethod=marker  foldlevel=0:

# ------------------- cmake ---------------------
alias cmap="cmake ../"      # cmap stand for: cmake parent. cdp
alias cmapd="cmake -DCMAKE_BUILD_TYPE=Debug   ../"    # Debug
alias cmapr="cmake -DCMAKE_BUILD_TYPE=Release ../"    # Release

alias cmad="cmake -DCMAKE_BUILD_TYPE=Debug"    # Debug
alias cmar="cmake -DCMAKE_BUILD_TYPE=Release"  # Release


# ------------------- make ---------------------
alias mk="make"

alias mka="make all"
alias mkb="make -B"
alias mkab="make all -B"

alias mkc="make clean"

alias mkd="make default"    # 比较某些时候, 仅仅想编译一些小的东西,验证语法问题等.

alias mkn="make -n"        # 仅查看执行效果: 不真正执行
alias mknb="make -n -B"    # 强制查看执行效果: 不真正执行

alias mkr="make run"

alias mki="make install"
alias mkui="make uninstall"
alias mkrm="make uninstall"

alias mkj="make -j"         # jobs 启用多线程编译
alias mkbj="make -j -B"     # 强制编译, 并使用多线程

alias mkp="make package"    # 编译deb包所用

alias mkm="make menuconfig"    # linux内核编译前的config, 用于生成config文件
