# vim: set foldmethod=marker  foldlevel=0:

# project
alias goproj="mkdir -p go_proj/{bin,build,cmd,doc,pkg,misc}"


# export
alias go11="export GO111MODULE=on"
alias nogo11="export GO111MODULE=off"
alias is_go11="eval echo '$'GO111MODULE"

alias goproxy="export GOPROXY=https://mirrors.aliyun.com/goproxy/"
alias nogoproxy="export GOPROXY=''"
alias is_goproxy="eval echo '$'GOPROXY"


# go
alias gor="go run"
alias gob="go build"
alias gog="go get"
alias gou="go get -u"           # update package(pull missing package) + update install bin
alias got="go test"
alias gof="go fmt"
alias gofa="go fmt ./..."
alias godd="go get ./..."       # download all dependency for current project(in current dir)

# ack go variable
# ack 'var $VAR'
# ack 'func $VAR'
# ack 'type $VAR'
# ack '$VAR .*='

alias goa="govendor add"
alias goae="govendor add +external"     # 添加所有不在vendor/目录中的依赖 到 vendor/目录中(从GOPATH/中移动到project/vendor/中)
                                        # 这样所有项目依赖都在project/ 下了, 可以全部交给git管理
alias gol="govendor list"               # 列出所有当前项目的依赖
alias gofet="govendor fetch"
alias gos="govendor sync"

# curl -o profiles6.pprof http://localhost:8086/debug/pprof/profile                 # 等待30秒, 获取这30秒influxdb运行的profile文件
alias gotop="go tool pprof -top"        # gotop profile6.pprof
alias gosvg="go tool pprof -svg"        # gosvg profile6.pprof, gosvg -output a.svg a.pprof
alias gogif="go tool pprof -gif"        # gogif profile6.pprof, gogif -output a.gif a.pprof


# go mod
alias  goo="GO111MODULE=on go"
# alias  gof="GO111MODULE=off"
alias  gom="GO111MODULE=on go mod"
alias gomi="GO111MODULE=on go mod init"     # 在本地初始化 go.mod
alias gomd="GO111MODULE=on go mod download" # 安装go mod 依赖到 ~/go/pkg/mod中
alias gomb="GO111MODULE=on go build "       # build项目, 如果没有库, 则拉取到 "GOPATH/pkg/mod" 中
alias gomv="GO111MODULE=on go mod vendor"   # 将"GOPATH/pkg/mod" 中 当前所需的pkg拷贝到vendor/中


# Golang包的查找顺序:
# 1. 如果使用了 GO111MODULE=on, 那么都会从GOPATH/pkg/mod 中寻找依赖包.
# 2. 如果使用了 GO111MODULE=off, 那么都会从 vendor/, 上层vendor/, GOPATH/src, GOROOT 顺序寻找依赖包.
