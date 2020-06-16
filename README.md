#tools-setting-linux

0: 部署顺序

   0-1: git clone https://git.oschina.net/CraneAgain/tools-setting-linux.git

   0-2: ./enable-tools.sh

        enable-tools.sh will call enable-tools-work/ 目录下的脚本

   0-3: source ~/.bashrc
        使之在当前终端生效. 或者退出bash, 重新进入bash.

        其它终端下次打开bash, 会自动生效.
        以后就可以用sb执行source ~/.bashrc.
        因为在subdir/myAlias.sh 中定义了 alias  sb="source ~/.bashrc"
                                         alias  so="source"


1: 目录名为tools-setting-linux/
   首字母不大写, 这样在bash或者其它任何shell中.
   都可以快速键入第一个字母.然后匹配进入.

    tools-setting-linux/ 子目录中:
    分为三个大类: cmdline-settings, desktop-settings/, misc-opes/

    cmdline-settings/  可以在服务器上还原的设置, 提高服务端效率.
        git-setting
        bash-setting
        tmux-setting
        xmodmap-setting

    desktop-settings/  可以在桌面环境还原的设置.

    misc-opes/ 各种相关软件的记录, 学习详情等.


2: 目的:存放工具配置
    bash                       : bash-setting
    zsh                        : zsh-setting
    bash + zsh                 : common-shell-setting
    git                        : git-setting
    tmux                       : tmux-setting
    xmodmap                    : xmodmap-setting


3: 关于bash/
   3-1: 这个目录中需要bash执行的脚本文件都以.sh结尾, 这样可以通过for 语句遍历 *.sh文件, 并执行.
        所以不需要bash执行的文件(即使是脚本文件): 不要以.sh结尾.
        如果需要vim高亮显示的:可以通过添加vim模式行设置filetype.
   3-2: bashrc还是使用系统的设置, 在bashrc中通过遍历source subdir下的*sh, 就可以了.
        appendBashrc.sh 就是做这个的.
   3-3: 因为每个Linux发行版的bashrc不同, 所以这里不对bashrc进行备份, 只在bashrc后面追加内容.


4: xmodmap, tmux, git 的配置文件都是隐藏文件, 所以我也在相应目录放置为隐藏文件.

   后期可以通过在文件中设置vim模式行, 使得可以在文件本身在vim中可以高亮.

   .gitconfig用vim打开时, 似乎是根据文件名设置类型的.
   如果没有".", 就没有高亮显示. 这是为什么我使用隐藏文件的原因.
   现在这个问题: 已经通过在文件顶部添加vim mode line解决了.  2017年 01月 20日 星期五 10:13:30 CST

   不过为了方便编辑, 针对任何隐藏文件, 同级目录下都有相应的非隐藏文件同名软链接.


5: enable-tools-work/ 目录放置脚本, 快速执行让本项目快速投入使用.
    be called by  enable-tools.sh

6: shell-learn/ 放置一些很好的bash脚本, 仅仅是学习, 参考, 记录, 收藏使用.


7: linux-ope/ 目录中保存着Linux系统级别的各种备份, 软件需求列表等等

8: install-OS-prepare 是安装系统前的准备

    主要是针对磁盘分区.

9: after-OS-install/ 中放着安装操作系统后, 第一次要执行的脚本.
   创建一些符合自己习惯的 ~/test/{c,c++,java,python,scheme,vim,bash}
                          /mySaved/, /myWork 目录

   安装必备软件等.
   目前只支持Ubuntu, 以后尽量兼容RedHat系列. (主要是软件包管理器的不同) ---2017年 02月 26日 星期日 15:02:37 CST
