# Import files
[ -f "$HOME/.config/aliasrc"    ] && source $HOME/.config/aliasrc
[ -f "$HOME/.config/aliashostrc" ] && source $HOME/.config/aliashostrc

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# ohmyzsh plugins
zinit snippet OMZP::git
zinit snippet OMZP::archlinux
zinit snippet OMZP::colored-man-pages

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTDUP=erase setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Change dir just by typing dirname
setopt autocd

# ls after cd
chpwd() {
  ls
}

# Turn off error beep
unsetopt beep

# keybindings
bindkey -v
bindkey "^[[H" beginning-of-line
bindkey "^a" beginning-of-line
bindkey -M vicmd "^a" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^e" end-of-line
bindkey -M vicmd "^e" end-of-line
bindkey "^[[3~" delete-char
bindkey "^f" autosuggest-accept

# Compinit
autoload -Uz compinit chpwd_recent_dirs cdr add-zsh-hook && compinit -d ~/.cache/.zcompdump add-zsh-hook chpwd chpwd_recent_dirs
zinit cdreplay -q

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell integrations
fzf --version >/dev/null 2>&1 && eval "$(fzf --zsh)"
zoxide --version >/dev/null 2>&1 && eval "$(zoxide init zsh)"
