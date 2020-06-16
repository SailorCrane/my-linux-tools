
1: sudo apt-get install -y fcitx-config-gtk

2: ls ~/.config/fcitx/      # 用户fcitx配置文件目录

3: 搜狗sogou 配置文件: http://www.voidcn.com/article/p-bhuvhswm-bpg.html
    ~/.config/sogou-qimpanel/   # 皮肤相关目录, 皮肤配置
    ~/.config/SogouPY.users/    # 应该是用户账号相关目录
    ~/.sogouinput/              # 临时存储文件之类

    ~/.config/SogouPY/          # 配置文件目录
        ~/.config/SogouPY/scdlist.ini : 词库配置
        Correction.ini
        sogouEnv.ini
        env.ini
        ~/.config/SogouPY/env.ini   # 配置文件
        sogou.version               # 版本信息
        useSkin.txt
        pingback.16:16              # 输出法备份时间
        scd                         # 词库目录, 存放词库

    /usr/bin/sogou-qimpanel         # 二进制文件, 打开.scel 词库文件的默认程序(安装词库)
                                    # 双击 .scel文件, 会执行: "sogou-qimpanel  /home/crane/Downloads/历史名人大全.scel"
                                    # 或者手动执行sogou-qimpanel : NOTE: 注意必须是绝对路径
