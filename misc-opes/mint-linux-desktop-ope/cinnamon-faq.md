
1. 双屏配置.
    menu 搜索"display", 或者搜索"monitor"

2. 任务栏taskbar 不要使用缩略图标, 使用完整任务图标.
    menu 搜索"welcome" -> "first steps" -> "desktop layout" -> "tradition"

3. 在"非主屏幕"/monitor上显示 一些任务taskbar.
    答: 通过google搜索"linux mint how to show taskbar on every monitor"
    1. 点击主屏的任务栏, 右键 --> add panel --> 选择位置为"非主屏幕"
    2. 在新添加的非主屏幕的panel上右键 --> "Applets" --> "windows list" --> 点击下方"+"按钮
    3. 把主屏幕上的一些任务栏的任务, 移动到非主屏幕: 在任务栏任务图标上右键 --> "Move to the other monitor"

4. "panel"是一个"块"区域的概念, panel上面承载这"applet"

5. "Applets" 的实现是通过"js" 实现的
    查看"Menu" 中的"Display"或者"Applets"Icon的"exec"
    发现是:  "/usr/bin/cinnamon-settings"可执行程序
    里面exec了 "/usr/share/cinnamon/cinnamon-settings/cinnamon-settings.py"
    和"/usr/share/cinnamon/cinnamon-settings/cinnamon-settings.py" 同目录的有"Applets", 打开进去发现都是js
    这里 /usr/share/cinnamon/applets/

6. cinnamon 配置, 在dconf中: "~/.conf/dconf/user"
    dconf dump '/org/cinnamon/'
