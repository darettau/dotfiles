export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

[[ $- != *i* ]] && return

alias ls='eza --icons --group-directories-first'
alias la='eza --icons --group-directories-first -a'
alias ll='eza --icons --group-directories-first -l'
alias lla='eza --icons --group-directories-first -la'
alias grep='grep --color=auto'

fastfetch
eval "$(starship init bash)"

export PATH="$PATH:$HOME/.local/bin"
