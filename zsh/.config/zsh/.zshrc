PLUGINS="$ZDOTDIR/plugins"
#PROMPTS="$ZDOTDIR/prompts"

# Import files
[ -f "$ZDOTDIR/.zshenv"         ] && source $ZDOTDIR/.zshenv
[ -f "$HOME/.config/aliasrc"    ] && source $HOME/.config/aliasrc
[ -f "$HOME/.config/functionrc" ] && source $HOME/.config/functionrc

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Change dir just by typing dirname
setopt autocd

# Turn off error beep
unsetopt beep

# Set Vi keymap
bindkey -v

# Compinit
zstyle :compinstall filename "$HOME/.config/zsh/.zshrc"
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Add plugins
[ -f "$PLUGINS/fzf-tab/fzf-tab.plugin.zsh" ] && source $PLUGINS/fzf-tab/fzf-tab.plugin.zsh 
[ -f "$PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; source $PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f "$PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; source $PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f "$PLUGINS/colored-man-pages.plugin.zsh" ] && source $PLUGINS/colored-man-pages.plugin.zsh
