# Add user if not owner of $HOME (sudo -s)
# Add hostname if over SSH
# Add user@hostname if both (requires adding SSH_CONNECTION to env_keep in sudoers)
_UPROMPT="%{$fg[green]%}%n%{$reset_color%}"
_HPROMPT="%{$fg[blue]%}%m%{$reset_color%}"
if [[ ( ~$USER != $HOME ) && ( -n "$SSH_CONNECTION" ) ]]; then
  PROMPT="${_UPROMPT}@${_HPROMPT} ${PROMPT}"
elif [[ ~$USER != $HOME ]]; then
  PROMPT="${_UPROMPT} ${PROMPT}"
elif [[ -n "$SSH_CONNECTION" ]]; then
  PROMPT="${_HPROMPT} ${PROMPT}"
fi
