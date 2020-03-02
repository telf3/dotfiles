NCOLOR="green"

PROMPT='%{$fg[$NCOLOR]%}%n%{$fg[green]%}@%m%{$reset_color%} %~ \
$(git_prompt_info)\
%{$fg[red]%}%(!.#.$)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}±%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="!"
