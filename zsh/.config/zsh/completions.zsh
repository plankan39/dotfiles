# Load completions
setopt globdots
autoload -Uz compinit && compinit -d "$ZSH_CACHE/zcompdump-$ZSH_VERSION"
zinit cdreplay -q

# Case-sensitive completion.
CASE_SENSITIVE="true"

ENABLE_CORRECTION="true"

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

