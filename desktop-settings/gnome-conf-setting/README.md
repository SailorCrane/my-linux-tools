
1:  ~/.config 的git仓库 配置

2: dconf dump /  > tmp-a.txt                                                        # 所有程序的配置


3.1:  ~/.config/gtk-3.0/bookmarks                                                     # 文件浏览器的标签(nemo, nautilus, thunar)

3.2  Ranger的书签位置位于:
     ~/.config/ranger/bookmarks

4:  dconf dump /org/nemo/                                                           # nemo 文件浏览器配置

5: dconf dump /org/gnome/terminal/legacy/profiles:/ > gnome-terminal-profiles.dconf # gnome-terminal 终端配置
