# Set the containing directory as ZDOTDIR to cause zsh
# to look for .zshrc and friends in this directory.
ZDOTDIR=${${(%):-%x}:P:h}
