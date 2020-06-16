# vim: set foldmethod=marker  foldlevel=0:

listFuns() {
    # {{{
    local ZshOpe='print -l ${(ok)functions} | cat -n'       # k keys, o ordered
    eval $ZshOpe
    # }}}
}


commonColor() {
  # {{{
  if which tput >/dev/null 2>&1; then
      ncolors=$(tput colors)
  fi

  if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then      # man bash: 搜索"CONDITION .*EXPRESSIONS\C" 就可以找到if选项
                                                                      # -t 测试fd = 1 是否打开, 1为标准输出
                                                                      # -n 测试 ncolors变量长度是否为0
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    BOLD="$(tput bold)"
    NORMAL="$(tput sgr0)"           # 注意是sgr0, not arg0
  else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    BOLD=""
    NORMAL=""
  fi
  # }}}
}


failureMsg() {
  #{{{
  if which tput >/dev/null 2>&1; then
      ncolors=$(tput colors)
  fi

  if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then      # man bash: 搜索"CONDITION .*EXPRESSIONS\C" 就可以找到if选项
                                                                      # -t 测试fd = 1 是否打开, 1为标准输出
                                                                      # -n 测试 ncolors变量长度是否为0
    RED="$(tput setaf 1)"
  else
    RED=""
  fi

  local  MsgColor=$RED
  printf "${MsgColor}$*\n"
  # }}}
}


warningMsg() {
  #{{{
  if which tput >/dev/null 2>&1; then
      ncolors=$(tput colors)
  fi

  if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then      # man bash: 搜索"CONDITION .*EXPRESSIONS\C" 就可以找到if选项
                                                                      # -t 测试fd = 1 是否打开, 1为标准输出
    GREEN="$(tput setaf 2)"
                                                                      # -n 测试 ncolors变量长度是否为0
  else
    GREEN=""
  fi
  local  MsgColor=$GREEN
  printf "${MsgColor}$*\n"
  # }}}
}


successMsg() {
  #{{{
  if which tput >/dev/null 2>&1; then
      ncolors=$(tput colors)
  fi

  if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then      # man bash: 搜索"CONDITION .*EXPRESSIONS\C" 就可以找到if选项
                                                                      # -t 测试fd = 1 是否打开, 1为标准输出
                                                                      # -n 测试 ncolors变量长度是否为0
    YELLOW="$(tput setaf 3)"
  else
    YELLOW=""
  fi

  local  MsgColor=$YELLOW
  printf "${MsgColor}$*\n"
  # }}}
}


# svn status prompt
prompt_svn() {
# {{{
    local rev branch
    if in_svn; then
        rev=$(svn_get_rev_nr)
        branch=$(svn_get_branch_name)
        if [[ $(svn_dirty_choose_pwd 1 0) -eq 1 ]]; then
            #prompt_segment yellow black
            #prompt_segment black yellow
            #prompt_segment black red
            echo -n "($rev@$branch)"
            #prompt_segment black yellow
            echo -n " ±"
            echo -n " "
        else
            #prompt_segment black red
            echo -n "($rev@$branch)"
            echo -n " "
        fi
    fi
# }}}
}
