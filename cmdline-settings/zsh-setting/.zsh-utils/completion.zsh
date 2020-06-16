
# if has kubectl command: NOTE:zsh
if env which kubectl >/dev/null 2>&1 ; then
    source <(kubectl completion zsh)
fi
