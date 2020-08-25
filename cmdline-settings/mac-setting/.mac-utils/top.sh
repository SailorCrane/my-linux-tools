#! /bin/sh
#
# top.sh
# Copyright (C) 2020 crane <crane@crane-pc>
#
# Distributed under terms of the MIT license.
#

if is_zsh; then
    SOURCE_NAME=$0
elif is_bash; then
    SOURCE_NAME=$BASH_SOURCE
fi

ALIAS_DIR=$(dirname $SOURCE_NAME)/alias
FUNC_DIR=$(dirname $SOURCE_NAME)/functions
unset SOURCE_NAME       # don't effect cmd line

# echo alias: $ALIAS_DIR

for file in  ${ALIAS_DIR}/*sh
do
    source ${file}
done

for file in  ${FUNC_DIR}/*sh
do
    source ${file}
done

