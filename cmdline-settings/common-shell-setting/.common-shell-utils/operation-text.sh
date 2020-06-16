# vim:set foldmethod=marker  foldlevel=0: vim modeline

# msuf  fileName  suffixName
# csuf  fileName  suffixName
#operate file suffix : add suffix to filename: move or copy
# example1: mv  file  -myback
# example2: cp  file  -myback
function _ope_suf {
    # {{{
    ope=$1          # mv or cp
    fileName=$2
    suffix="-back"

    if [ $# -eq 3 ]
    then
        suffix=$3
    fi

    $ope  $fileName  ${fileName}${suffix}
    # }}}
}

# suf: suffix
function csuf {
    # {{{
    UsageMsg='csuf  <file/dir> [suffix]'

    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    fileName=$1
    suffix=$2

    # call _ope_suf
    _ope_suf  cp  $fileName  $suffix
    # }}}
}

# suf: suffix
function msuf {
    # {{{
    UsageMsg='msuf  <file/dir> [suffix]'

    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    fileName=$1
    suffix=$2

    # call _ope_suf
    _ope_suf  mv  $fileName  $suffix
    # }}}
}




function  headInsert {
# {{{
    if [ $# -lt 2 ] ; then
        echo "Usage:  headInsert  <string>/[fileName]"
        echo "Usage:  headi       <string>/[fileName]"
        return
    fi

    destFile=$2     # 后面会多次使用

    # 注意文件 "$1" 使用双引号括起来, 这样如果有空格, 比如"my name is Crane"
    # 会被当做一个参数, 如果不使用双引号, 那么会被 -f 当做多个参数, bash出错.(参数不匹配)
    if [ -f  "$1" ]; then     # 如果$1是文件, 使用cat + mv
        # 疑问: 即使$1是文件, 但是就是想插入$1的字符串怎么办?, 目前解决方案, 可以在命令行$1前后多加一个空格
        # 应该解决方案: 使用-f, -s参数决定是文件, 还是字符串
        fromFile=$1

        destTmpFile=${destFile}-tmp-no-save

        cat $fromFile $destFile  >> $destTmpFile
        mv  -f  $destTmpFile  $destFile

    else            # 如果$1 不是文件, 那么当做字符串插入
        #echo $1
        insertStr=$1

        sed "1i${insertStr}"  $destFile  -i
    fi

    return
# }}}
}
alias headi=headInsert


# 编辑随机名文件
function  vimrandom {
# {{{
    vim $(randomString)
# }}}
}
alias scratch=vimrandom
alias vimr=vimrandom


# 输出文件或者stdin的指定列
# example: col  1, 不带参数名, 那么从stdin读取
#        : col  1 fileName, 带参数名, 那么从文件读取
function  col {
# {{{
    UsageMsg="col  <columnNum>  [file]\nExample 'col  2  /etc/passwd'"

    # ${UsageMsg} 两边要加上引号.!!!
    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    # 对标准输入进行列输出, (支持标准输入的, 支持管道)
    if [ $# -lt 2 ] ; then     # 只有一个参数
        # echo "has no filename"
        awk -v  colNum=$1 '{print $colNum}'
        return
    # 对文件输出列
    else                    # 两个参数, 那么第二个参数会被当做文件名
        # echo "specify filename"
        fileName=$2
        awk -v  colNum=$1 '{print $colNum}' $fileName
    fi
# }}}
}

# 交换两个文件的内容: 类似于swap(a, b)
# example: mx  a.cpp b.cpp
mx()
{
#{{{
    UsageMsg="mx  <afile>  <bfile>"

    if ! ParaUsage "${UsageMsg}" 1 $* ; then
        return -1
    fi

    local  randFileName=$(randomString)
    SwapRandFile="/tmp/swp-${randFileName}"     # 每个函数使用的自己的临时文件, 都要有自己的前缀.这样即使没有删除, 也可以找到

    local  aFile=$1
    local  bFile=$2

    # 先判断可读可写

    mv  ${aFile}         ${SwapRandFile}
    mv  ${bFile}         ${aFile}
    mv  ${SwapRandFile}  ${bFile}

    # 清除临时文件
    rm -f ${SwapRandFile}
#}}}
}


# unrar-all + unzip-all
# 29 unrar all file in current directory
unrar-all()
{
#{{{
    for file in *.rar; do unrar e $file; done      # unrar need "e" argument
#}}}
}

unzip-all()
{
#{{{
    for file in *.zip; do unzip   $file; done      # unzip dont need "e" argument
#}}}
}


# md is alias mkdir in oh-my-zsh/lib/directory.zsh
# mdc= mkdir + cd
mdc()
{
#{{{
    local  objDir=$1
    if mkdir -p $objDir; then
    # if [ $? ] ; then
        cd $objDir
        return 0
    else
        echo "create dir $objDir failed"
        return -1
    fi
#}}}
}

# copy all 2 current new dir
copyall2curnew()
{
#{{{
    UsageMsg="copyall2curnew  <newdir> "

    if ! ParaUsage "${UsageMsg}" 1 $* ; then
        return -1
    fi

    local  dir=$1
    local  dotDir="."${dir}

    mkdir  ${dotDir}
    if [ ! $? ] ;then
        echo "create dir ${dotDir}  failed"
        return -1
    fi

    mv  *  ${dotDir}            # 需要dotDir 是因为 mv * 时, 如果已经存在dir. "*"中也会包含 dir
                                # 但 shell 的 "*" 不统配 "."打头的隐藏文件.
    mv ${dotDir}  ${dir}
#}}}
}
alias ca2=copyall2curnew    # ca2 stand for: copy all to



# du -hs + sort
dus()
{
#{{{
    UsageMsg="dus  <files, dirs> "

    if ! ParaUsage "${UsageMsg}" 1 $* ; then
        return -1
    fi

    du -hs $@ | sort -h
#}}}
}
