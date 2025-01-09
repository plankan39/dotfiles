
if [[ -x $(command -v zoxide) ]]; then
    eval "$(zoxide init zsh)"
    alias cd="z"
fi
# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="z .."
alias ...="z ../.."
alias ....="z ../../.."
alias .....="z ../../../.."
alias -- -="z -"

