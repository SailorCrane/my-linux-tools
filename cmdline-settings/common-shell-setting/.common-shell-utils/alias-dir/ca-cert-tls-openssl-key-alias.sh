
# 1: Ubuntu 操作系统更新根证书步骤:  系统
# mkdir -p /usr/local/share/ca-certificates/extra
# cp  my_ca.crt  /usr/local/share/ca-certificates/extra
# sudo update-ca-certificates
# cat /etc/ssl/certs/ca-certificates.crt              # 更新之后, 根证书内容就会到里面, 表示根证书生效了

# 2: NOTE: chrome or firefox,  Ubuntu下的chrome和firefox不跟随使用系统根证书(和windows不同)
# 所以需要浏览器手动导入根证书, 但是普通用户导入根证书: 不会起作用(除非普通用户安装 apt-get install libnss3-tools )
# 或者使用root运行chrome, 在settings中导入根证书
# 方式1: 安装 libnss3-tools, 普通用户也可以在chrome settins也可以导入根证书
# 方式2: 不安装libnss3-tools, root 运行chrome, 然后在settings导入根证书

# 3: 关于客户端所用证书(用于双向验证的): 是给浏览器或者其它客户端用的, 此类证书和系统无关
# 如果浏览器要用这类证书, 只能在浏览器中导入cert



# 生成ca私钥和ca证书, generate ca private key + ca.crt
alias ca_key="openssl genrsa -out ca.key 2048"
alias ca_crt="openssl req -x509 -new -nodes -key ca.key -subj '/CN=crane.com' -days 5000 -out ca.crt"


# 摘要相关算法: digest alias
alias md5="md5sum"       # md5 file, md5 <<< "node-1" 这种方式应该是带回车的, md5生成的是16字节的二进制数据, 可以输出为32个字符的hex
alias sha1="sha1sum"     # sha1 file
alias sha256="sha256sum" # sha512 file
alias sha512="sha512sum" # sha256 file

# openssl md5 /etc/passwd
# openssl sha256 /etc/passwd



#=================== CA and server key Example  =====================

# =================== chrome export symmetric key  =====================
# export不应该写在这里, 应该在profile中
export SSLKEYLOGFILE="$HOME/log/sslkeylog.log"
