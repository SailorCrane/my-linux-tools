# 使得fcitx 不会覆盖xmodmap 的设置.
# 这样使用fcitx切换输入法, 就不会overwritexmodmap的设置了.
# 通过google 搜索"fcitx  disable  xmodmap"
# http://rozen-lin.blogspot.hk/2017/03/disable-fcitx-from-overwriting-xmodmap.html

gsettings set org.gnome.settings-daemon.plugins.keyboard active false
