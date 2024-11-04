# Plugin manager ZINIT
# Install if not installed
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

# Cache directory to be used
ZSH_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}"/zsh
[ ! -d $ZSH_CACHE ] && mkdir -p $ZSH_CACHE


# Initialize zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZ::plugins/git/git.plugin.zsh

zinit load zsh-users/zsh-history-substring-search
zinit ice wait atload'_history_substring_search_config'

# Load completions
setopt globdots
autoload -Uz compinit && compinit -d $ZSH_CACHE/zcompdump-$ZSH_VERSION
zinit cdreplay -q


# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

# Case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"


HISTFILE=$ZSH_CACHE/zsh_history
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups



if [ -d $ZDOTDIR/zshrc.d ]; then
  for file in $ZDOTDIR/zshrc.d/*; do 
    source $file; 
  done
fi

[[ -x $(command -v starship) ]] && eval "$(starship init zsh)"

