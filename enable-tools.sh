#! /bin/bash
#
# enable-tools.sh
# Copyright (C) 2017 crane <crane@ubuntu>
#
# Distributed under terms of the MIT license.
#

# NOTE:
cd bin/
./backup_and_rm.sh          # backup and remove file
./mk_soft_links.sh             # make soft link
./append_bash_profile.sh    # append content
./mk_test_dir.sh            # ~/test/ dirs
./zsh_install.sh            # 安装zsh, 并设置为默认SHELL
#./mk_depth_dir.sh           # zsh depth
