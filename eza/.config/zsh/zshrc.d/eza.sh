# ls aliases
# use eza instead of ls if available for colored output
if [ -x "$(command -v eza)" ]; then
  alias eza="eza --icons"
  alias l="eza -1a"
  alias la="eza -lagh"
  alias ls="eza"
fi

