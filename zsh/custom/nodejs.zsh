# Configure NodeJS to use XDG base directories so that `npm install -g`
# installs to a per-user directory, and add the bin dir to the PATH
if (( ! ${+commands[node]} )); then
  return
fi

export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

if ! [[ "$PATH" =~ "$XDG_DATA_HOME/npm/bin" ]]; then
  export PATH="$XDG_DATA_HOME/npm/bin:$PATH"
fi
