#! /bin/bash

# PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w ↓$(get_current_depth)\$ "
# \[\$(function)\], 类似eval, 每次实时计算
PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w \[↓\$(get_current_depth)\]\$ "
