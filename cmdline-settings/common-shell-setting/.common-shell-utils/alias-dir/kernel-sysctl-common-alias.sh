# vim: set foldmethod=marker  foldlevel=0:

#alias sysa='sudo sysctl -a 2>&1 || sysctl -a '
alias sysa='sudo sysctl -a 2>&1'

alias vm="sysa | grep vm"
