#! /bin/bash
#
# backup.sh
# Copyright (C) 2020 crane <crane@sharp>
#
# Distributed under terms of the MIT license.
#

source ./base.sh

cp  ~/.config/gtk-3.0/bookmarks  bookmarks       # 文件浏览器 bookmarks

dconf dump ${NemoDconf}  >  ${NemoProfile}       # nemo 文件浏览器配置

dconf dump ${TerminalDconf} > ${TerminalProfile} # gnome-terminal 终端配置, 包括快捷键
# dconf reset -f /org/gnome/terminal/legacy/ > ${TerminalProfile} # gnome-terminal 终端配置, 包括快捷键

# gsettings get org.gnome.Terminal.ProfilesList default     # gsettings
# https://askubuntu.com/questions/731774/how-to-change-gnome-terminal-profile-preferences-using-dconf-or-gsettings
# dconf dump /org/gnome/terminal/legacy/profiles:/ > gnome-terminal-profiles.dconf # gnome-terminal 终端配置
# dconf dump /org/gnome/
