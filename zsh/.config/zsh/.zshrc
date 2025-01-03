# Source plugins
source $ZDOTDIR/plugins

# Completions
source $ZDOTDIR/completions

# Extra configurations
for file in $ZDOTDIR/zshrc.d/*; do 
  source $file; 
done

