# vim:set foldmethod=marker  foldlevel=0: vim modeline
#
# base-functions.sh
# Copyright (C) 2017 crane <crane@crane-pc>
#
# Distributed under terms of the MIT license.
#

# sb() {
#     # function中的 "source" + "alias" 对 function执行时的shell不起作用
#     # source something
#     # alias a=b
# }


islogin() {
    shopt -q login_shell && echo 'yes' || echo 'no'
}

isinter() {

    [[ $- == *i* ]]  && echo 'yes' || echo 'no'
    # if [[ $- == *i* ]] ;then
    #     echo 'yes'
    # else
    #     echo 'no'
    # fi

}
