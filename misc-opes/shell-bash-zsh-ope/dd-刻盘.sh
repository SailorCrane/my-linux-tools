# dd命令制作启动盘, 注意数据写完后, 要等待数据写入磁盘, 再拔.
# 有时候, dd写完U盘后, nautilus会善意提醒, 还有数据正在写入
# 不要拔.

# 或者使用 oflag=sync选项, 使得dd等待写入磁盘后, 再返回.

# bs=2M 会大大提升写入速率. 注意"M"大写

# 注意/dev/sdc 才是设备, 而不是/dev/sdc1等.后面不要添加数字.
# 写完之后, 可以在Nautilus中点击弹出U盘.
# 如果缓存还没有写入U盘, Nautilus会有相应提示.
# 这样等缓存写完后, nautilus会自动弹出U盘.

dd  if=my.iso  of=/dev/sdc  bs=2M oflag=sync


# dd不能写Windows 的iso, 只能通过软碟通写(win 的iso中不带MBR)
# wine 安装软碟通, 安装成功了, 但是最后一个, 下拉列表无法找到然后磁盘.
