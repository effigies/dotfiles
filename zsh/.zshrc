## Uncomment and run zprof to profile startup
#zmodload zsh/zprof

if ! [[ "$PATH" =~ "$HOME/.local/bin:" ]]; then
    PATH="$HOME/.local/bin:$PATH"
fi
export PATH

# Enable oh-my-zsh plugin manager
export ZSH="$ZDOTDIR/ohmyzsh"
ZSH_CUSTOM=$ZDOTDIR/custom
ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/oh-my-zsh"
ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompdump"

unset ZSH_THEME  # Disable themes
# Completion options
CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
# History options
HIST_STAMPS="yyyy-mm-dd"
plugins=(aliases direnv colored-man-pages git rust zoxide)
source $ZSH/oh-my-zsh.sh

# Lines configured by zsh-newuser-install
# HISTFILE=~/.histfile
# HISTSIZE=1000
# SAVEHIST=1000
# setopt autocd
# unsetopt beep
# bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall

# zstyle ':completion:*' auto-description 'specify: %d'
# zstyle ':completion:*' completer _list _complete _ignored _approximate _prefix
# zstyle ':completion:*' format 'Completing %d'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' ignore-parents parent
# zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' matcher-list '' 'r:|[._-]=* r:|=*'
# zstyle ':completion:*' max-errors 2
# zstyle ':completion:*' squeeze-slashes true
# zstyle ':completion:*' verbose false
# zstyle :compinstall filename '/var/home/chris/dotfiles/zsh/.zshrc'

# autoload -Uz compinit
# compinit
# End of lines added by compinstall

if type "starship" > /dev/null; then
  eval "$(starship init zsh)"
fi

[[ "$(command -v atuin)" ]] && eval "$(atuin init zsh)"
# Bling enables atuin and zoxide, and aliases ls to eza and *grep to ug
### bling.sh source start
# test -f /usr/share/ublue-os/bluefin-cli/bling.sh && source /usr/share/ublue-os/bluefin-cli/bling.sh
### bling.sh source end
