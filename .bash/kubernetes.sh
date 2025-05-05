# aliases for kubernetes

command -v kubectl &>/dev/null && source <(kubectl completion bash)
command -v helm &>/dev/null && source <(helm completion bash)
helm plugin list 2>/dev/null | grep -q diff && source <(helm diff completion bash)

alias k=kubectl
complete -o default -F __start_kubectl k
alias kx='f() { [ "$1" ] && kubectl config use-context $1 || kubectl config current-context ; } ; f'
alias kn='f() { [ "$1" ] && kubectl config set-context --current --namespace $1 || kubectl config view --minify | grep namespace | cut -d" " -f6 ; } ; f'
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
