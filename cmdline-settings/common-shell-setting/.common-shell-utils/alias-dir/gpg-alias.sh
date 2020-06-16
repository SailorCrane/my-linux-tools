
alias gpg_list="gpg --list-secret-key"

# gpg_sign hello.txt (will generate hello.txt.gpg), --sign产生的gpg包含signature + origin data
# gpg --sign必须提前生成了用户公私钥
alias gpg_sign="gpg --sign"
alias gpg_import="gpg --import"      # gpg_import 导入某公钥, 用于verity被此公钥签名的文件

alias gpg_verify="gpg --verify "     # gpg_verify hello.txt hello.txt.sig (gpg_verity hello.txt.gpg)
alias gpg_detach="gpg --detach-sign" # gpg_detach hello.txt(产生.sig文件, 只包含签名)
