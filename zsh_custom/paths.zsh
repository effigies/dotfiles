# Places I've dropped miscellaneous scripts or installed with some package manager
# If it exists, add it to the path

PATHS=(
  $HOME/bin
  $HOME/.bin
  $HOME/.local/bin
  $HOME/.cabal/bin
)
for P in $PATHS; do if [ -d $P ]; then export PATH="$P:$PATH"; fi; done
