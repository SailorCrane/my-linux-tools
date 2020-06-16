#! /bin/bash

# 检查alias中是否有非合法条目: 和builtins冲突或者和keywords冲突

builtins_list_fun() {
    #builtins_list="enable -a | cut -d " " -f 2,3"
    builtins_list=$(enable | cut -d " " -f 2,3)
    echo $builtins_list
    # for i in $builtins_list; do
    #     echo $i sep
    # done
}


# 只能被source调用, 才会拿到当前进程的alias
alias_list_fun() {
    #alias -p
    #alias | egrep '[^ ]*=.*'  --only | grep '^[^=]*'  --only
    alias_list=$(alias | egrep '[^ ]*=.*'  --only | grep '^[^=]*'  --only)
    echo $alias_list
}

## NOTE:array contains code(zsh, bash index base in different)
# function contains() {
#     local n=$#
#     local value=${!n}
#     for ((i=1;i < $#;i++)) {
#         if [ "${!i}" == "${value}" ]; then
#             echo "y"
#             return 0
#         fi
#     }
#     echo "n"
#     return 1
# }

# A=("one" "two" "three four")
# if [ $(contains "${A[@]}" "one") == "y" ]; then
#     echo "contains one"
# fi
# if [ $(contains "${A[@]}" "three") == "y" ]; then
#     echo "contains three"
# fi


# alias_list=$(alias_list_fun)
# echo $alias_list
