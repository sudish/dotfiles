#!/bin/bash

clone_or_update() {
  dir=$1
  remote=$2

  echo "Updating $dir from $remote:"
  [[ -d $dir ]] || git clone $remote $dir
  (cd $dir && git pull)
}

clone_or_update powerlevel10k                 https://github.com/romkatv/powerlevel10k.git
clone_or_update zsh-autosuggestions           https://github.com/zsh-users/zsh-autosuggestions.git
clone_or_update zsh-syntax-highlighting       https://github.com/zsh-users/zsh-syntax-highlighting.git
clone_or_update zsh-history-substring-search  https://github.com/zsh-users/zsh-history-substring-search.git
