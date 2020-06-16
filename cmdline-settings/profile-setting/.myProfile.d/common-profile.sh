# vim:set foldmethod=marker  foldlevel=0: vim modeline
# This file is for user custom setting
# for some  export  variable : 一些需要export的变量
# for once execute scripts: 一次执行的脚本
# 使用方式:  软链接profile目录到~/.profileDir, 然后在~/.profile后追加source

# 2 Ubuntu 16.10 搜狗开机不启动, 必须log out, 再log in才启动的解决方案
# {{{
#export LC_ALL=zh_CN.utf8
#export XMODIFIERS=@im=fcitx
#export QT_IM_MODULE=xim
#export GTK_IM_MODULE=xim
#fcitx -d
# }}}

# 3 xmodmap
# xmodmap ~/.Xmodmap      # for mint

# 4 开机清空~/.zsh_depth/目录, 但是source ~/.profile也会执行, 所以还是关机执行
#env rm -rf  ~/.zsh_depth/*


# 5 django settings variable
# django_set_proj=django_settings_base
# django_set_dir=${HOME}/${django_set_proj}/${django_set_proj}

# export PYTHONPATH=$PYTHONPATH:${django_set_dir}
#export DJANGO_SETTINGS_MODULE=settings


# 6: no_proxy: http proxy white lists
export no_proxy='10.0.0.0/8,127.0.0.1,localhost'
