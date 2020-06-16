# 使用vim脚本批量处理文件
# 使用vim -e 选项, 和 bash < 重定向输入符号

change.vim: 内容如下(每个换行, -e 执行命令时, 会被自动换成回车输入, 注意quit后面还有个换行) 
%s/-person-/Jones/g
write tempfile
quit

for file in *.txt; do
    vim -e -s $file < change.vim
    lpr -r tempfile
done
