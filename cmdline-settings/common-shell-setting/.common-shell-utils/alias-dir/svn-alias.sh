# vim: set foldmethod=marker  foldlevel=0:

# svn alias
alias sa="svn add"
alias saa="svn status | grep '^?' | sed 's/^? *\(.*\)/\"\1\"/g' | xargs svn add"

alias sbl="svn blame"  # show file line who changed

alias slo="svn log"
alias sle="svn log | less"

alias st="svn status"
alias sd="svn diff"
alias sc="svn commit"
alias scm="svn commit -m"
#alias sp="svn update"        # now alias to ---> 'svn_update' function

#alias sdl="svn delete"       # delete
alias sde="svn delete"       # delete
alias sra="svn status | grep '^!' | sed 's/^! *\(.*\)/\"\1\"/g' | xargs svn rm"

alias sv="svn revert"        # revert
alias svr="svn revert -R"    # recursive revert

alias scu="svn cleanup"     #

alias scr="svnadmin create"     # svn create locla repo
#alias sco="svn_checkout_local" # co file:///
