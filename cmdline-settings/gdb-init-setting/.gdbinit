# vim:set foldmethod=marker  foldlevel=0 filetype=gdb: vim modeline

# 注意: 注释只能顶头写, 类似与C/C++ 的宏指令, 不能在命令后面跟 #写注释
# 这个文件做一个软链接到 ~/.gdbinit, 或者gdb执行文件所在目录下.
# gdb执行时, 会自动加载.

#1: gdb global setting
# {{{
# 每次delete所有断点, ctrl+d/quit退出时 ....   不需要确认.
set confirm off


# b/break 和clear相对应: 都可以使用行号, 函数名等
# delete, disable, enable 可以使用列表: 在列表中指明断点编号: d 1 2 3


# shell ls 查看 当前目录下的文件

# }}}

#2: break setting,  breakpoints-about: 断点相关
# {{{

# 在main函数下断点
define bm
    break main
end

# 在file 中下断点. 注意最后的".", 在正则表达式中表示所有字符
# 必须程序start之后, 才可以在文件下断点?
# 总之只要可以l file:line 查看源码, 就可以使用rb file:. 下断点
# bf stand for: break in file
define bf
    rbreak $arg0:.
end

# breakpoints list
define  bl
    info breakpoints
end


# info breakpoints, 和自定义bl功能相同.(查看登记breakpoint信息)
# 如果不使用define: i b 则是内部自定义的info breakpoints的缩写
define  ib
    info breakpoints
end

# break clear: 删除1 到 100的断点( 删除所有断点 )
define bc
    delete  1-100
end

# }}}

#3: step about, 调试过程相关.
# {{{

# start
define  st
    start
end

# until
define un
    until $arg0
end

define fi
    finish
end

# set follow-fork-mode <mode>
# 调试父进程, 或者调试子进程.
# df satnd for: debug father
# dp stand for: debug parent
# dc stand for: debug child
define  df
    set follow-fork-mode  parent
end

define  dc
    set follow-fork-mode  child
end

# handle signal INT: gdb不处理SIGINT(Ctrl+C)信号, 直接传送给被调试的进程.
define hsi
    handle SIGINT nostop print pass
end

# }}}

#4: info about, 使用info 查看gdb等级信息.
# {{{

define  id
    info display
end

# 本想用if, 但是if是关键字, 所以不能占用. 选用iif
define iif
    info frame
end

# }}}

#5 : show-about: show binary data
# {{{

# /100cb  100组个 char, 每组是一个byte
define  x1
    x /100cb  $arg0
end

# 查看200个字节
define  x2
    x /200cb  $arg0
end

# dp stand for display, not debug parent
define dp
    display
end

# }}}


#6 : show argv[0] argv[1] about main(int argc, char *argv[])
# {{{
# example: args  "myargs"
define args
    set args $arg0
end

define  a0
    print  (char *)argv[0]
end

define  a1
    print  (char *)argv[1]
end

define  a2
    print  (char *)argv[1]
end
# }}}

#7 : thread-about
# {{{
define it
    info threads
end

define t1
    thread 1
end

define t2
    thread 2
end

define t3
    thread 3
end

define t4
    thread 4
end

define t5
    thread 5
end

define t6
    thread 6
end

# }}}

#100 : learn mess
# {{{
#13. 设置显示选项
#set print address
#set print address on
#打开地址输出，当程序显示函数信息时，GDB会显出函数的参数地址。系统默认为打开的，
#show print address
#查看当前地址显示选项是否打开。

#set print array
#set print array on
#打开数组显示，打开后当数组显示时，每个元素占一行，如果不打开的话，每个元素则以逗号分隔。这个选项默认是关闭的。与之相关的两个命令如下，我就不再多说了。

#set print array off
#show print array

#set print elements
#这个选项主要是设置数组的，如果你的数组太大了，那么就可以指定一个来指定数据显示的最大长度，当到达这个长度时，GDB就不再往下显示了。如果设置为0，则表示不限制。

#show print elements
#查看print elements的选项信息。

#set print null-stop
#如果打开了这个选项，那么当显示字符串时，遇到结束符则停止显示。这个选项默认为off。

#set print pretty on
#如果打开printf pretty这个选项，那么当GDB显示结构体时会比较漂亮。


# display command learn
#display expr
#Add the expression expr to the list of expressions to display each time your program stops. See Expressions.

#display does not repeat if you press <RET> again after using it.
#display/fmt expr
#For fmt specifying only a display format and not a size or count, add the expression expr to the auto-display list but arrange to display it each time in the specified format fmt. See Output Formats.
#display/fmt addr
#For fmt `i' or `s', or including a unit-size or a number of units, add the expression addr as a memory address to be examined each time your program stops. Examining means in effect doing `x/fmt addr'. See Examining Memory.

#这里讲一下显示数组：

#假设定义了一个数组

#char array[4];

#那么在gdb当中就可以用如下的方式：

#display /x *array@4

#gdb就会吧array数组以十六进制显示了！
# }}}
