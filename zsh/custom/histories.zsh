# Set per-user history files, useful for `sudo -s`
# Requires creataing a world-writable ~/.zsh_hist and
# adding HOME to env_keep in sudoers
mkdir -p $HOME/.zsh_hist/$USER
export HISTFILE=$HOME/.zsh_hist/$USER/hist

# Save history from running shell by dropping into a snapshot
# Signal the shell with `kill -USR1 <PID>`
TRAPUSR1() {
  mkdir -p ~/.zsh_hist/$USER/snapshots
  fc -IW ~/.zsh_hist/$USER/snapshots/$(date +%Y.%m.%d.%H.%M.%s)
}
