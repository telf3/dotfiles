#!/bin/bash

# Plugins to install
declare -A plugins
plugins["fzf-tab"]="git clone https://github.com/Aloxaf/fzf-tab.git"
plugins["zsh-fzf-history-search"]="git clone https://github.com/joshskidmore/zsh-fzf-history-search.git"
plugins["zsh-autosuggestions"]="git clone https://github.com/zsh-users/zsh-autosuggestions.git"
plugins["zsh-syntax-highlighting"]="git clone https://github.com/zsh-users/zsh-syntax-highlighting"
plugins["colored-man-pages.plugin.zsh"]="curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/colored-man-pages/colored-man-pages.plugin.zsh -o"

if [ ! -d $PLUGINS ]; then
  read -p "No zsh plugins directory, install now? (Y/n): " resp
  if [ -z "$resp" ]; then
      response_lc="y" # empty is Yes
  else
      response_lc=$(echo "$resp" | tr '[:upper:]' '[:lower:]') # case insensitive
  fi
  [ "$response_lc" = "y" ]
  mkdir -p $PLUGINS
fi

for plugin in "${!plugins[@]}"; do
  if [ ! -e "$PLUGINS/$plugin" ]; then
    bash -c "${plugins[$plugin]} $PLUGINS/$plugin"
  fi
done
