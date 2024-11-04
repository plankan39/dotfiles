export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_DIRS="/etc/xdg"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export EDITOR="nvim"
export VISUAL="nvim"
export RUSTUP_HOME="/home/lukaselmlund/.local/share/rustup"
export CARGO_HOME="/home/lukaselmlund/.local/share/cargo"
PATH=/home/lukaselmlund/.local/bin:$PATH

source /home/lukaselmlund/.local/share/cargo/env

