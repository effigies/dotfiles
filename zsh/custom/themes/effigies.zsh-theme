# Add user if not owner of $HOME (sudo -s)
# Add hostname if over SSH
# Add user@hostname if both (requires adding SSH_CONNECTION to env_keep in sudoers)
_UPROMPT="%{$fg[green]%}%n%{$reset_color%}"
_HPROMPT="%{$fg[blue]%}%m%{$reset_color%}"
if [[ ( ~$USER != $HOME ) && ( -n "$SSH_CONNECTION" ) ]]; then
  DPROMPT="${_UPROMPT}@${_HPROMPT} "
elif [[ ~$USER != $HOME ]]; then
  DPROMPT="${_UPROMPT} "
elif [[ -n "$SSH_CONNECTION" ]]; then
  DPROMPT="${_HPROMPT} "
fi

PROMPT="$DPROMPT%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
