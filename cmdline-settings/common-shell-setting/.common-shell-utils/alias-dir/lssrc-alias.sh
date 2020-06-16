# vim: set foldmethod=marker  foldlevel=0:

# ack -f --py
# ack -f --sh
# ack -f --c
# ack -f --txt
alias lspy="find  . -name '*.py'"
alias lspyc="find  . -name '*.pyc' -o -name '__pycache__'"
alias lsvim="find  . -name '*.vim'"
alias lssh="find  . -name '*.sh'"
alias lszsh="find  . -name '*.zsh'"
alias lstxt="find . -name '*.txt'"

alias lsjs="find . -name '*.js'"
alias lshtml="find . -name '*.html'"
alias lscss="find . -name '*.css'"

alias lssql="find . -name '*.sql'"

alias lsc="find -L . -name '*.h' -or -name '*.c'"       # -L follow soft link
alias lscc="ack -f --cc"                                # ack --follow soft link
#alias lscc="find   . -name '*.cpp' or -name '*.cxx'"
alias lshh="ack -f --hh"

# ls package
alias lspa="find . -name  '*.zip' -o -name '*.rar' -o -name '*.gz' -o -name '*.tar' -o -name '*.apk'"
alias lsdeb="find . -name  '*.deb'"
alias lsrpm="find . -name  '*.rpm'"
alias lspdf="find . -name '*.pdf'"

alias lsr="find . -name '*'"                                 # all
alias lsf="find . -name '*' -type f"                         # normal
alias lsfg="find . -name '*' -type f -not -path '*/.git/*'" # exclude '.git/'
alias lse="ack -f"                                           # editable
alias lsd="find . -name '*' -type d"                         # dirs
