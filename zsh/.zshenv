# XDG dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_DIRS="/etc/xdg"

# Cache directory to be used
export ZSH_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}"/zsh
[ ! -d $ZSH_CACHE ] && mkdir -p $ZSH_CACHE

# ZSH directory to load config from
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

export EDITOR="nvim"
export VISUAL="nvim"

# expand path
PATH=/home/lukaselmlund/.local/bin:$PATH

# Skip the not really helping Ubuntu global compinit
skip_global_compinit=1

# load other environment scripts
if [ -d $ZDOTDIR/zshenv.d ]; then
  for file in $ZDOTDIR/zshenv.d/*; do 
    source $file; 
  done
fi

