
# =================== tar =====================
# alias tarc="tar  cvf"
# alias tarx="tar  xvf"

tarc() {
    if [[ $# == 0 ]]; then
        echo "has no file input, nothing to do"
        return 1
    fi

    files=$*
    file_name=$1

    tz_suffix="tz"
    tarz_name=${file_name}.${tz_suffix}

    # TODO check file exist
    echo "=== will tar to >> ${tarz_name}"
    tar -czvf ${tarz_name} $*
    echo "=== has tared to >> ${tarz_name}"
}

tarx() {
    tarz_name=$1
    extract_dir=${tarz_name%%.*}        # a.b.c ===> a

    if [[ -e "${extract_dir}" ]] ; then
        extract_dir=${extract_dir}-$(date +"%Y-%m-%d-%H:%M:%S")
    fi

    echo "=== will extract into ${extract_dir}"
    mkdir -p ${extract_dir}

    tar -zxvf ${tarz_name} -C ${extract_dir}
    echo "=== has extracted into ${extract_dir}"
}

alias tarz="tar zcvf"
alias tarj="tar jcvf"
alias tarJ="tar Jcvf"

alias tart="tar  tvf"       # cat files list
alias tartz="tar ztvf"       # cat files list


# =================== zip =====================
#

zipc() {
    if [[ $# == 0 ]]; then
        echo "has no file input, nothing to do"
        return 1
    fi

    files=$*
    file_name=$1

    tz_suffix="zip"
    tarz_name=${file_name}.${tz_suffix}

    # TODO check file exist
    echo "=== will zip to >> ${tarz_name}"
    zip ${tarz_name} $*
    echo "=== has ziped to >> ${tarz_name}"
}

alias zipx="unzip"

alias zipt="unzip -t"
