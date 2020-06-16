
# lock screen, shutdown, reboot, suspend
#alias lock="gnome-screensaver-command -l"       # Ubuntu
alias lock="cinnamon-screensaver-command --lock" # Linux Mint


# 后期做成函数, 根据当前用户是否为root添加sudo
alias susp="sudo pm-suspend"     # 因为bash已经内置suspend, 用来禁止终端反应(除非收到SIGCONT信号), 所以这里使用susp

#alias shut="sudo shutdown -h now"
#alias shut="shutdown -h now"    # 不需要sudo, 也不需要密码. 普通用户也可以关机.
#alias re="shutdown -r now"    # 不需要sudo, 不需要密码, 普通用户可以随意重启的.
