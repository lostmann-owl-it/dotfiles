# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200


# export PROMPT_COMMAND='
#   h="$HOME"
#   t="$PWD"
#   [[ "$t" == "$h"* ]] && t="~${t#$h}"
#   echo -ne "\033]0;${USER}@$(hostname -s): $t\007"
# '

update_terminal_title() {
  local t="$PWD"
  [[ "$t" == "$HOME"* ]] && t="~${t#$HOME}"
  # Nur setzen, wenn keine aktive Vollbild-App l√§uft
  echo -ne "\033]0;${USER}@$(hostname -s): $t\007"
}

export PROMPT_COMMAND=update_terminal_title

test -s ~/.alias && . ~/.alias || true
eval "$(direnv hook bash)"
# source <(kubectl completion bash)
# source <(kubectl deprecations completion bash)
# source <(helm completion bash)
# source <(helm diff completion bash)
# source <(argocd completion bash)
# source ~/bash/kube-ps1.sh
# source /opt/k8s/lostmann/dev/git-prompt.sh
# PS1='\[\033[1;30m\]\A \[\033[1;32m\]\u\[\033[1;37m\]@\[\033[1;36m\]\h\[\033[00m\]:\[\033[1;34m\]\w $(kube_ps1) \[\033[0;33m\]$(__git_ps1 "git:[%s]")\[\033[00m\]\$ '
# PS1='[\u@\h \W $(kube_ps1)]\$ '

export STARSHIP_CONFIG=~/.config/starship/starship.square.toml
eval "$(starship init bash)"

# alias k=kubectl
# complete -o default -F __start_kubectl k
# alias kx='f() { [ "$1" ] && kubectl config use-context $1 || kubectl config current-context ; } ; f'
# alias kn='f() { [ "$1" ] && kubectl config set-context --current --namespace $1 || kubectl config view --minify | grep namespace | cut -d" " -f6 ; } ; f'
# export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"


complete -C /home/lostmann/minio-binaries/mc mc

[[ -f ~/.bash/directories.sh ]] && source ~/.bash/directories.sh
[[ -f ~/.bash/kubernetes.sh ]] && source ~/.bash/kubernetes.sh
[[ -f ~/.bash_completions/kubectl-ns-completion.bash ]] && source ~/.bash_completions/kubectl-ns-completion.bash
[[ -f ~/.bash_completions/kubectl-ctx-completion.bash ]] && source ~/.bash_completions/kubectl-ctx-completion.bash

if [ -n "$TMUX" ] && [ -n "$SSH_AUTH_SOCK" ]; then
    tmux set-environment -g SSH_AUTH_SOCK "$SSH_AUTH_SOCK"
fi


# Auto-Warpify
[[ "$-" == *i* ]] && printf 'P$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "bash", "uname": "Linux" }}ú' 
