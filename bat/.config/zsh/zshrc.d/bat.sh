# use bat instead of cat if it exists
[[ -x "$(command -v bat)" ]] && alias cat="bat --style=plain --paging=never"
if [[ -x "$(command -v batcat)" ]]; then
    alias cat="batcat --style=plain --paging=never"
    alias bat="batcat"
fi

# export BAT_THEME="Catppuccin Mocha"
# export BAT_THEME_DARK="Catppuccin Mocha"
# export BAT_THEME_LIGHT="Catppuccin Latte"

