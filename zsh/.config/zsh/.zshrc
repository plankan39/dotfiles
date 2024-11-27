# Source plugins
source $ZDOTDIR/plugins

# Completions
source $ZDOTDIR/completions


for file in $ZDOTDIR/zshrc.d/*; do 
  source $file; 
done


