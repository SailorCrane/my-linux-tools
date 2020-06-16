# vim: set foldmethod=marker  foldlevel=0:

# common_shell_dir=~/.common-shell-utils
# ALIAS_DIR=${common_shell_dir}/alias-dir

is_bash() {
    if [ -n "$BASH_VERSION" ]; then
        return 0
    else
        return -1
    fi
}

is_zsh() {
    if [ -n "$ZSH_VERSION" ]; then
        return 0
    else
        return -1
    fi
}

if is_zsh; then
    SOURCE_NAME=$0
elif is_bash; then
    SOURCE_NAME=$BASH_SOURCE
fi

ALIAS_DIR=$(dirname $SOURCE_NAME)/alias-dir
# echo '$ALIAS_DIR   ==' $ALIAS_DIR
# echo '$SOURCE_NAME ==' $SOURCE_NAME
unset SOURCE_NAME       # don't effect cmd line

for file in  ${ALIAS_DIR}/*sh
do
    source ${file}
done

#unset ALIAS_DIR       # don't effect cmd line
