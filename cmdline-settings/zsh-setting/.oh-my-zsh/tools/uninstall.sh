read -r -p "Are you sure you want to remove Oh My Zsh? [y/N] " confirmation


# 确认删除zsh
if [ "$confirmation" != y ] && [ "$confirmation" != Y ]; then
  echo "Uninstall cancelled"
  exit
fi

echo "Removing ~/.oh-my-zsh"
if [ -d ~/.oh-my-zsh ]; then
  rm -rf ~/.oh-my-zsh
fi

# 恢复安装oh-my-zsh 前的zshrc
echo "Looking for original zsh config..."

if [ -f ~/.zshrc.pre-oh-my-zsh ] || [ -h ~/.zshrc.pre-oh-my-zsh ]; then
  echo "Found ~/.zshrc.pre-oh-my-zsh -- Restoring to ~/.zshrc";

  # 备份当前zshrc
  if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
    ZSHRC_SAVE=".zshrc.omz-uninstalled-$(date +%Y%m%d%H%M%S)";
    echo "Found ~/.zshrc -- Renaming to ~/${ZSHRC_SAVE}";
    mv ~/.zshrc ~/"${ZSHRC_SAVE}";
  fi

  mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc;

  echo "Your original zsh config was restored. Please restart your session."

else
  # 如果不存在./.zshrc-pre-oh-my-zsh文件, 恢复默认shell 为 bash
  if hash chsh >/dev/null 2>&1; then
    echo "Switching back to bash"
    chsh -s /bin/bash
  else
    echo "You can edit /etc/passwd to switch your default shell back to bash"
  fi
fi

echo "Thanks for trying out Oh My Zsh. It's been uninstalled."
