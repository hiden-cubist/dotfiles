autoload -Uz compinit promptinit colors vcs_info
compinit
promptinit
colors

setopt nonomatch

setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

PROMPT='
%{$fg_bold[blue]%}%n%#%M%{$reset_color%}:%~
> '

RPROMPT='${vcs_info_msg_0_}'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

#pipenv
export PATH="$HOME/.local/bin:$PATH"

alias ls='ls -la --color=auto'
