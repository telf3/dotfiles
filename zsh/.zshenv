typeset -U path PATH

# Add directories to PATH
path=(~/bin ~/.local/bin $path)

export KEYTIMEOUT=1
export EDITOR=/usr/bin/vim

export PROMPT="%F{green}%n%F{blue}@%M%F{white} %~ λ "
