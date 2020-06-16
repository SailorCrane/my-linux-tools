#! /bin/sh
#
# sed-在Bundle-链接后面加git后缀.sh
# Copyright (C) 2017 crane <crane@crane-pc>
#
# Distributed under terms of the MIT license.
#

# 替换前1 Bundle 'Tagbar'       # 单引号
# 替换前2 Bundle "Tagbar"       # 双引号
# 替换后  Bundle "Tagbar.git"

#sed -i -r  's/(Bundle\s+")([^"]*)(")/\1\2.git\3/'   $(find . -name  "*.vim")
sed -i -r  "s/(Bundle\s+)([\"'])([^\"]*)([\"'])/\1\"\3.git\"/"   $(find . -name  "*.vim")


# 但是不能避免 如下情况
# 替换后  Bundle "Tagbar.git" 替换为
# 替换后  Bundle "Tagbar.git.git"

# 因为sed似乎不支持(?!.git).这种前向否定形式 (这是perl的语法)
# regex - sed with negative lookahead in file (google搜索语句)
