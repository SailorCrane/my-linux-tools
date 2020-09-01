
# https://unix.stackexchange.com/questions/149965/how-to-copy-merge-two-directories

merge() {
    if ! [ $# -eq 2 ] ; then
        echo "merge() need at least two parameters!!!"
        return -1
    fi

    local src="${1}/"
    local dest=$2

    rsync -a $src $dest
}
