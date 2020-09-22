
alias srst="brew services restart"
alias sst="brew services start"
alias sstp="brew services stop"

unalias sss
sss() {
    local Service=$1
    brew services list | grep $Service -C 5
}
