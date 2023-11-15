# Case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
export HISTFILE=${XDG_CACHE_HOME:-$HOME/.cache}/.zsh_history
HIST_STAMPS="yyyy-mm-dd"


if [ -d $ZDOTDIR/zshrc.d ]; then
  for file in $ZDOTDIR/zshrc.d/*; do 
    source $file; 
  done
fi

[[ -x $(command -v starship) ]] && eval "$(starship init zsh)"
