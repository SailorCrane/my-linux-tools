# 自己使用的目录结构: 以后无论在什么地方
# 目录结构尽量和这里的一致

# 0: set  subdir env
# 后面都使用bash_subdir变量, 不要将目录路径写死, 这样以后好修改
common_shell_dir=~/.common-shell-utils
dir_envs=${common_shell_dir}/dir_envs

# 1-1: 静态环境
# my saved: static
# 书籍, 文档类存放在这里
mySaved="/mySaved"
myBook="${mySaved}/book"

# 1-2 常用目录路径: 下面放置着Unity Dash图标配置
# 注意:路径变量最好不要以"/"结尾, 这样可以使用$VAR/mydir 形式扩展
DashApp=/usr/share/applications
LocalDashApp=~/.local/share/applications
IconApp=/usr/share/pixmaps      # 图标位置
BackPick=/usr/share/backgrounds # 桌面背景图片位置, Ubuntu下
DeskPick=/usr/share/backgrounds


# =================== 子目录中其它路径环境 =====================
# 有些应该放置在profile中
# 2: 动态环境
# my work: dynamic
# myCurrentWork 中的变量, 尽量放置在这里
myWork="/myWork"
myDesign="${myWork}/myDesign"
myCode="${myWork}/myCode"

# 2-1: 使subdir/WorkEnv 中脚本执行: 设置工作目录变量
for file in  ${dir_envs}/WorkEnv/*sh
do
    source ${file}
done


# 3: 软件 + 库 环境
#    手动安装的软件目录
# 放置类型: 手动安装的软件, 手动安装的C/CPP库, 头文件, JAVA_HOME, Java库, Python都放在这里
# 注意别忘记设置PATH

# 3-1: 软件环境
# 自己手动安装的软件, 比如sqldeveloper, java, eclipse, tomcat等的环境变量, 都放置在这里
for file in  ${dir_envs}/mySoftwareEnv/*sh
do
    source ${file}
done

# 3-2: 库环境
# 使subdir/CompileEnv 中脚本执行: 设置工作目录变量
# CompileEnv中存放着Java库 和 C/CPP库路径 的相关路径的 环境变量设置
# 这里的for循环, 可以写成一个函数,多次使用了
for file in  ${dir_envs}/CompileEnv/*sh
do
    source ${file}
done
