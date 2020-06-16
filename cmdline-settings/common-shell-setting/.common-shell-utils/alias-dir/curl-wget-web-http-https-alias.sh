# vim: set foldmethod=marker  foldlevel=0:

# curl -L -O www.baidu.com
alias curl_insecure="curl -k"  # skip verify ssl cert(has no ca)

alias hget="curl"              # http GET(default method)
alias hpost="curl  -X POST"    # http POST: hpost -i  'localhost:9999/asdf' --data-binary 'a,agentid=6 value=5'

# NOTE: curl POST从文件读取发送的body/data-binary
# hpost 'localhost:8080/write?consistency=all&db=massive&precision=ns&rp=' --data-binary @send_data.txt
alias hpatch="curl -X PATCH"   # http PATCH
alias hput="curl -X PUT"       # http PUT
