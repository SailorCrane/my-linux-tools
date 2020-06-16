
# sort by kth column
alias s1="sort -k1"
alias s2="sort -k2"
alias s3="sort -k3"
alias s4="sort -k4"

# sort + uniq
#alias  suniq="sort | uniq"  # 如果直接uniq 过滤, 那么不连续的相同字符串, 还是会output多次.
alias  soun="sort | uniq"  # 如果直接uniq 过滤, 那么不连续的相同字符串, 还是会output多次.

# uniq 做统计(添加统计列), 并unique
# sort -nr, 使用数字value进行排序(-n 使用)
alias headc="history | col 2 | sort  | uniq -c | sort -nr | head -30"       # 查看最常用的命令, zsh下有zsh_stats
