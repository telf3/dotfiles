typeset -U path PATH

# Add directories to PATH
path=(~/bin ~/.local/bin $path)

# Default ZSH directory
export ZDOTDIR="$HOME/.config/zsh"

export KEYTIMEOUT=1
export EDITOR=/usr/bin/vim

export PROMPT="%F{green}%n%F{blue}@%M%F{white} %~ λ "

export PLUGINS="$HOME/.local/share/zsh/plugins"
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
