zstyle :omz:plugins:ssh-agent agent-forwarding on

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="telf"

plugins=(
   git
   colored-man-pages
   common-aliases
   ssh-agent
   tmux
   archlinux
)

source $ZSH/oh-my-zsh.sh

# Set default editor
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Vi mode
bindkey -v
bindkey '^R' history-incremental-search-backward
export KEYTIMEOUT=1

# Sudo aliases
alias sudo='sudo '
alias pls='sudo $(fc -ln -1)'
