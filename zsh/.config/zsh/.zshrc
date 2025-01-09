# Source plugins
source $ZDOTDIR/plugins.zsh

# Completions
source $ZDOTDIR/completions.zsh

# Extra configurations
for file in $ZDOTDIR/zshrc.d/*; do 
  source $file; 
done

