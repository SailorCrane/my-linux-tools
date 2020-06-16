
# 使用grep + sed 替换邮箱,: 完毕后, 非常有成就感
# 用武之地: 如果文件量很大, 可以用来替换变量名, 函数名, 函数调用名, 类名, 路径名等等...
# 当然如果不使用sed, 这里也可以使用vim自动脚本的技巧来完成. 不过结果稍显麻烦.
# 使用sed更为自然一些

# 步骤如下:
# 1 使用grep 过滤出包含 123456789@qq.com 的文件
# 2 awk 过滤出文件名
# 3 for 循环输出测试
# 4 sed 单独命令测试
# 5 sed + for循环

MailOld='123456789@qq.com'
MailNew='user@abc.com'
# 1
#grep --exclude-dir="*.git*"  -e  $MailOld  . -R | grep  $MailOld


# 2 这里获取包含 123456789的文件名列表: 注意最后的 过滤 .sh, 即过滤本文件, 因为本文件和待操作文件处于统一目录, 并且包含 123456789@qq.com
#grep --exclude-dir="*.git*"  -e  $MailOld  . -R | grep  $MailOld | awk  -F: '{print $1}'  | grep -v -e "\.sh"

# 循环测试文件, 使用echo
# FileNames=$(grep --exclude-dir="*.git*"  -e  $MailOld  . -R | grep  $MailOld | awk  -F: '{print $1}'  | grep -v -e "\.sh")

# 这里可以不使用awk -F: 过滤文件名, 使用grep 提供的-l参数即可
FileNames=$(grep --exclude-dir="*.git*"  -e  $MailOld  . -R -l |  grep -v -e "\.sh")

#for file in $FileNames
#do
    #echo $file
#done


# 3 测试sed, 针对单个文件
# 先输出到标准输出, 然后再使用 -i (inplace选项)
# 测试通过后, 在循环中执行
# 注意使用$MailOld变量, 不可以使用''单引号包裹

#sed  "s/$MailOld/$MailNew/g"  Galaxy_MTS_DB.hpp | less
#sed -i  "s/$MailOld/$MailNew/g"  Galaxy_MTS_DB.hpp

for file in $FileNames
do
    sed -i  "s/$MailOld/$MailNew/g"  $file
done

# 因为这里面有些关于binary 的说明, 其实不包含 123456789@qq.com
