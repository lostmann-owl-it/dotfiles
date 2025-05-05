# Changing/making/removing directory

# Pushd behavior customization (not available in bash, comments kept for context)
# setopt auto_pushd
# setopt pushd_ignore_dups
# setopt pushdminus

alias ...='../..'
alias ....='../../..'
alias .....='../../../..'
alias ......='../../../../..'

alias -- -='cd -'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias md='mkdir -p'
alias rd=rmdir

function d () {
  if [[ -n $1 ]]; then
    dirs "$@"
  else
    dirs -v | head -n 10
  fi
}

# List directory contents
if command -v exa &>/dev/null; then
    # If exa exists, create the alias with icons and long format
    alias ll='exa --group-directories-first --icons -l'
    alias l='exa --group-directories-first --icons -la'
    alias lt='exa --group-directories-first --icons -T'
elif command -v eza &>/dev/null; then
    # If eza exists, create the alias with icons and long format
    alias ll='eza --group-directories-first --icons -l'
    alias l='eza --group-directories-first --icons -la'
    alias lt='eza --group-directories-first --icons -T'
else
    # If exa does not exist, fallback to ls with long format
    alias ll='ls -lah'
    alias l='ls -lh'
fi
