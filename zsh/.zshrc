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

# set tmux window name to hostname
ssh() {
  if [ -n "$TMUX" ]; then
    # filter out -flags
    local host=""
    for arg in "$@"; do
      if [[ "$arg" != -* ]]; then
        host="$arg"
        break
      fi
    done

    if [ -n "$host" ]; then
      tmux rename-window "$host"
    fi

    command ssh "$@"

    tmux set-window-option automatic-rename on
  else
    command ssh "$@"
  fi
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

if oh-my-posh version >/dev/null 2>&1; then
  eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/telf.toml)"

  # oh-my-posh vi mode integration
  # https://github.com/JanDeDobbeleer/oh-my-posh/issues/5438
  _omp_redraw-prompt() {
    local precmd
    for precmd in $precmd_functions; do
      $precmd
    done

    zle .reset-prompt
  }

  function _omp_zle-keymap-select() {
      if [ "${KEYMAP}" = 'vicmd' ]; then
          export ZSH_VI_MODE="N"
      else
          export ZSH_VI_MODE="I"
      fi

      _omp_redraw-prompt
  }
  _omp_create_widget zle-keymap-select _omp_zle-keymap-select

  # Reset to default mode at the end of line input reading
  function _omp_zle-line-finish() {
      export ZSH_VI_MODE="I"
  }
  _omp_create_widget zle-line-finish _omp_zle-line-finish

  # Catch SIGINT (C-c) in CMD mode, reset to Insert mode and repropagate SIGINT
  TRAPINT() {
      export ZSH_VI_MODE="I"
      return $(( 128 + $1 ))
  }
fi
