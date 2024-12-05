# Set the containing directory as ZDOTDIR to cause zsh
# to look for .zshrc and friends in this directory.
ZDOTDIR=${${(%):-%x}:P:h}

# Ensure XDG directories are set to defaults if not otherwise set
if [[ -z "$XDG_CONFIG_HOME" ]]; then
  export XDG_CONFIG_HOME=$HOME/.config
fi
if [[ -z "$XDG_CACHE_HOME" ]]; then
  export XDG_CACHE_HOME=$HOME/.cache
fi
if [[ -z "$XDG_DATA_HOME" ]]; then
  export XDG_DATA_HOME=$HOME/.local/share
fi
if [[ -z "$XDG_STATE_HOME" ]]; then
  export XDG_STATE_HOME=$HOME/.local/state
fi
if [[ -z "$XDG_RUNTIME_DIR" ]]; then
  export XDG_RUNTIME_DIR=/run/user/$UID
fi
