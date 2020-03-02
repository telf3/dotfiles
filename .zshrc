zstyle :omz:plugins:ssh-agent agent-forwarding on

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="jreese"

plugins=(
   git
   zsh_reload
   colored-man-pages
   common-aliases
   ssh-agent
   virtualenv
)

source $ZSH/oh-my-zsh.sh

# Set default editor
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
