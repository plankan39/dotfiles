HISTFILE=${ZSH_CACHE:-"$HOME/.cache/zsh"}/zsh_history
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
