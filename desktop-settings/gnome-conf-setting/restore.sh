#! /bin/bash
#
# backup.sh
# Copyright (C) 2020 crane <crane@sharp>
#
# Distributed under terms of the MIT license.
#


source ./base.sh

cp   bookmarks   ~/.config/gtk-3.0/bookmarks

dconf load ${NemoDconf}  <  ${NemoProfile}
dconf load ${TerminalDconf} < ${TerminalProfile}


RepoPath="${HOME}/.config/.gitignore"
GitIgnore=$(readlink -f ./conf-gitignore)

if [ -e ${RepoPath} ] || [ -h ${RepoPath} ] ; then
    # 存在时
    echo Exists, Will be mv [$GitIgnore]
    mv $RepoPath $RepoPath-back
    ln -s $GitIgnore $RepoPath
else
    # 不存在时
    echo No Exist [$GitIgnore]
    ln -s $GitIgnore $RepoPath
fi
