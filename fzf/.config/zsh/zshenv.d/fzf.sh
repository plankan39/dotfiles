# Setup fzf
# ---------
# 
if [[ ! "$PATH" == *${XDG_DATA_HOME:-"$HOME/.local/share"}/fzf/fzf/bin* ]]; then
  PATH=$PATH:"${XDG_DATA_HOME:-$HOME/.local/share}/fzf/fzf/bin"
fi

