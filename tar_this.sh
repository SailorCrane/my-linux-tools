#! /bin/bash
#
# tar_this.sh
# Copyright (C) 2019 crane <crane@gosun>
#
# Distributed under terms of the MIT license.
#

tar --exclude='softwares/*'  -zcvf /tmp/oh-my-linux-tools.tgz  .git

# tar --exclude='softwares'  -zcvf /tmp/oh-my-linux-tools.tgz  .
