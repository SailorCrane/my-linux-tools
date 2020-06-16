
readlink  ~/.vimrc  # 显示软链接指向的真正的文件路径

readlink  -f  ../myFile  # 显示文件绝对路径, 可以用在脚本中, 或者在终端复制文件时
