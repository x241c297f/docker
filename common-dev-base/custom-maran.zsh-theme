# Theme with full path names and hostname
# Handy if you work on different servers all the time;
PROMPT='$(git_prompt_info)%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[yellow]%}%M:%{$fg[green]%}%(4~|.../%3~|%~)%{$reset_color%} %(!.#.$) '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}git:("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%} "
