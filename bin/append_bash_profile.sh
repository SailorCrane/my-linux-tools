#!/bin/bash

existContent() {

    content=$1
    file=$2

    grep  $content  $file  >> /dev/null  # disable match output

    return $?

}

append_src2_dest() {

    content=$1
    append_dest=$2
    append_src=$3

    if  ! existContent $content  $append_dest; then
        echo              >> ${append_dest}     # new white line
        echo $content     >> ${append_dest}
        cat  $append_src  >> ${append_dest}
    else
        echo "content [exists] in ${append_dest} (OK)"
    fi

}


env echo -e '\n------------------- append "~/.bashrc"  "~/.profile" ---------------------'

#1: ~/.bashrc
content="#append_bash_content"
append_dest=~/.bashrc
append_src=".append_bash_content"
append_src2_dest $content $append_dest $append_src


#2: ~/.profile
content="#append_profile_content"
append_dest=~/.profile
append_src=".append_profile_content"
append_src2_dest $content $append_dest $append_src
