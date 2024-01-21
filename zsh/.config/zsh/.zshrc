# Import files
[ -f "$ZDOTDIR/.zshenv"         ] && source $ZDOTDIR/.zshenv
[ -f "$HOME/.config/aliasrc"    ] && source $HOME/.config/aliasrc
[ -f "$HOME/.config/aliashostrc" ] && source $HOME/.config/aliashostrc

# Change dir just by typing dirname
setopt autocd

# ls after cd
chpwd() {
  ls
}

# Turn off error beep
unsetopt beep

# Set Vi keymap
bindkey -v
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

# Compinit
zstyle :compinstall filename "$HOME/.config/zsh/.zshrc"
autoload -Uz compinit chpwd_recent_dirs cdr add-zsh-hook && compinit -d ~/.cache/.zcompdump add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# z
[ -f "/usr/share/z/z.sh" ] && . /usr/share/z/z.sh

# Add plugins
[ -f "$PLUGINS/fzf-tab/fzf-tab.plugin.zsh" ] && source $PLUGINS/fzf-tab/fzf-tab.plugin.zsh 
[ -f "$PLUGINS/zsh-fzf-history-search/zsh-fzf-history-search.zsh" ] && source $PLUGINS/zsh-fzf-history-search/zsh-fzf-history-search.zsh
[ -f "$PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source $PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f "$PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source $PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f "$PLUGINS/colored-man-pages.plugin.zsh" ] && source $PLUGINS/colored-man-pages.plugin.zsh
