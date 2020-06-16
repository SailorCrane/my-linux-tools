# vim:set ft=zsh :
#
# local ret_status="%(?:%{$fg_bold[green]%}✓:%{$fg_bold[red]%}✘)"
# ✗, ✘,
# ✓
local ret_status="%(?:%{$fg_bold[green]%}➜:%{$fg_bold[red]%}➜)"
#local shell_depth='eval "$""(get_current_depth)"'

#PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
#PROMPT='${ret_status}%{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'    # %c stand for current dir
#PROMPT='${ret_status}%{$fg[cyan]%}%{$reset_color%} $(git_prompt_info)'    # %d stand for dir
local userAtPc="%n@%m:"         # 用户名+主机名
#PROMPT='${ret_status} ${userAtPc} %{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info) $(svn_prompt_info)'     # %~ stand for ~/

local depth_fg="%{$fg[yellow]%}↓"
#PROMPT='${ret_status} ${userAtPc} %{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)$(prompt_svn) %{$fg[yellow]%}d$(get_current_depth) '     # %~ stand for ~/
PROMPT='${ret_status} ${userAtPc} %{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)$(prompt_svn)${depth_fg}$(get_current_depth) '     # %~ stand for ~/

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
