

# 使用env which, 防止alias which(trick)
if env which ack >/dev/null 2>&1 ; then
    #echo 'Yeah! has ack' in /usr
    alias ack="ack --color"
else
    #echo 'Bad, has no ack in /usr, use yourself ack'
    alias ack="ack-single --color"      # 在用户的bin目录中 "/home/crane/.common-shell-utils/bin/ack-single"
fi

alias lw="ack --nocolor -o '[a-zA-Z_]+' -w"       # list all words
alias ackt="ack --help-types"           # list all supported file type
alias ackq="ack -Q"                     # --literal, 不转义, 直接搜索plain text
alias ackf="ack -f"                     # 仅仅打印出所有会被搜索的文件, 不做真正的搜索

alias acklist="ack -f"                  # 仅仅打印出所有会被搜索的文件, 不做真正的搜索
alias ackfile="ack -l"                  # 匹配后, 仅打印出匹配结果的文件名

#alias envc="env | ack '(.*?)\=(.*)'"    # env color, colored variable and value
#alias envc="env | ack '(.*?)=.*'"     # env color, colored variable [后面的.*为了不再次匹配 (.*?)=)使得同行多次高亮]
alias envc="env | ack '^(.*?)='"     # env color, colored variable [(.*?)非贪婪匹配: perl正则语法]
