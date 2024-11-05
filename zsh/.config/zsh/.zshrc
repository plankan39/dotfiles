# Source plugins
source $ZDOTDIR/plugins

# Completions
source $ZDOTDIR/completions


if [ -d $ZDOTDIR/zshrc.d ]; then
  for file in $ZDOTDIR/zshrc.d/*; do 
    source $file; 
  done
fi


