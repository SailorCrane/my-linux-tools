# vim:set foldmethod=marker  foldlevel=0: vim modeline
#!/bin/bash

function  randomString {
# {{{
    openssl rand -base64  10 | tr -dc "a-zA-Z"      # openssl wile output random string
# }}}
}

# 外部调用时, 传入suffix
function  cpPubKeyFile {
# {{{
    pubKeyFile="~/.ssh/id_rsa.pub"
    #copySuffix=$(randomString)
    copySuffix=$1
    copyKeyFile="${pubKeyFile}${copySuffix}"

    # 因为要解析${} 和 "~"目录, 所以需要eval两次解析
    eval cp  ${pubKeyFile}  ${copyKeyFile}
    echo  ${copyKeyFile}
# }}}
}

# pushSSHKey   user ip  passwd
function  pushSSHKey {

    if [ $# -lt 3 ] ; then
        echo "usage: pushSSHKey user ip passwd"
        return
    fi

    ./genePubKey-expect.sh     # generate key

    copySuffix=$(randomString)      # cp to suffix-ed key
    copyKeyFile=$(cpPubKeyFile  ${copySuffix})

    #echo ${copyKeyFile}
    copyKeyFile=$(eval readlink -f ${copyKeyFile})      # get absolute path

    HomeCopyKeyFile=$(basename  ${copyKeyFile})
    HomeCopyKeyFile="~/${HomeCopyKeyFile}"
    echo $HomeCopyKeyFile

    user=$1
    hostName=$2
    password=$3
    ./scpPubKey-expect.sh  "${copyKeyFile}"   $user $hostName $password  ${HomeCopyKeyFile}
}
