eval "$(starship init bash)"
eval "$(zoxide init bash)"

# set alias
alias ll='exa -l'
alias la='exa -la'
alias lt='exa -lrs time'
alias ltr='exa -ls time'
alias tree='exa -TL'
alias du='du -h'
alias df='df -h'
alias bat='bat -n'

# set XDG_CONFIG_HOME, LD_LIBRARY_PATH
export XDG_CONFIG_HOME="$HOME/.config"
export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"
export PATH="$HOME/.local/bin:$PATH"
