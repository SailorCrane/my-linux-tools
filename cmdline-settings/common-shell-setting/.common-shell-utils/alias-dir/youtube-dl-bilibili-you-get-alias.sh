
# =================== youtube-dl =====================
# NOTE: 终端执行proxy 使得https_proxy可用, 可访问youtube
# NOTE: pipu3 youtube-dl 升级youtube-dl

# ------------------- argument ---------------------
# -i : ignore
# -t : title , conflict with -o ''
# -o : specify output name
# -c : continue from part (断点续传)
# -k : keep video (后续处理后, 依然保存video, 默认删除)


# ------------------- mp3, mp4 ---------------------
# alias  dl_mp4_list="youtube-dl --write-sub --write-auto-sub -k -cit "                                        # 在有title, 并且有index时使用
alias  dl_mp4_list="youtube-dl --write-sub --write-auto-sub -ci  -o \"%(autonumber)s-%(title)s.%(ext)s\"" # 在title没有index时使用
alias  dl_mp3_list="youtube-dl -i --extract-audio --audio-format mp3"


# ------------------- other  ---------------------
alias  dl_video="youtube-dl --write-sub --write-auto-sub -k --no-playlist -cit"
alias  dl_sub="youtube-dl --write-sub --write-auto-sub -ci"
#alias  dl_list_urls="youtube-dl --write-sub --write-auto-sub --flat-playlist -ci"
alias  dl_list_urls="youtube-dl --write-sub --write-auto-sub --flat-playlist -ci"       # only urls


# NOTE: 下载mp3(听书) playlist(可能需要apt-get install ffmpeg用来提取mp3)
# https://www.youtube.com/watch?v=NLWB1YAvf6E&list=PLbiMTnSFLTb7CCQrgblPnUOud6V-qFyJd&index=5       水浒传
# https://www.youtube.com/watch?v=CU6b7Becgiw&list=PLxrrEGwTz_JoirAqymLPCMBXfsyK7iJRP               红楼梦
# https://www.youtube.com/watch?v=kllF6XsEIa4&list=PLbiMTnSFLTb4_yJHe00EfsQjSS9z05evZ&index=5       金瓶梅
# youtube-dl -i --extract-audio --audio-format mp3 https://www.youtube.com/watch?v=kllF6XsEIa4&list=PLbiMTnSFLTb4_yJHe00EfsQjSS9z05evZ&index=5
# youtube-dl -i --extract-audio --audio-format mp3 PLbiMTnSFLTb4_yJHe00EfsQjSS9z05evZ

# youtube-dl -i --extract-audio --audio-format mp3 'https://www.youtube.com/watch?v=CU6b7Becgiw&list=PLxrrEGwTz_JoirAqymLPCMBXfsyK7iJRP' --playlist-start=103

# youtube-dl -i --extract-audio --audio-format mp3 'https://www.youtube.com/watch?v=CU6b7Becgiw&list=PLxrrEGwTz_JoirAqymLPCMBXfsyK7iJRP' --playlist-start=4 --playlist-end=10

# youtube-dl -i --extract-audio --audio-format mp3 'https://www.youtube.com/watch?v=CU6b7Becgiw&list=PLxrrEGwTz_JoirAqymLPCMBXfsyK7iJRP' --playlist-start=10 --playlist-end=20

# NOTE: 下载视频 playlist
# youtube-dl -i -f mp4 --yes-playlist 'https://www.youtube.com/watch?v=CU6b7Becgiw&list=PLxrrEGwTz_JoirAqymLPCMBXfsyK7iJRP&index=1'


# NOTE: 参数: 断点续传(指定playlist index)
# --flat-playlist       # only list name
# --playlist-start=10
# --playlist-end=10
# --playlist-reverse

# =================== you-get b站 =====================
