# Set color shorthand
autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE GREY; do
    eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
done
PR_BOLD="%{$terminfo[bold]%}"
PR_NC="%{$terminfo[sgr0]%}"

# Sneak title-control into each prompt, setting a basic user@host:path title
SET_TITLE=`echo -n "%{\\033]0;%n@%m:%~\\007%}"`
# Prompt: user@host.tty:~/current/path%
_USER="$PR_LIGHT_RED%n@%m$PR_NC"
_PTY="$PR_BLUE%y$PR_NC"
_STATUS="%(?.$PR_LIGHT_GREEN.$PR_LIGHT_RED)[%?]$PR_NC"
prompt="$SET_TITLE$_USER.$_PTY$_STATUS:$PR_BOLD%~$PR_NC%# "

# Update title when running a command
function preexec {
    echo -n "\033]0;$USER@$(hostname):${PWD/$HOME/~} : $1\a"
}

#
# History options
#
export HISTFILE=~/.zsh_hist	# History file
export SAVEHIST=100000		# Lines to save
export HISTSIZE=100000		# Again
setopt HIST_IGNORE_ALL_DUPS

#
# Changing directory options
#
setopt AUTO_CD			# Simply type the directory to cd
setopt AUTO_PUSHD		# Push directories on stack by default
setopt PUSHD_IGNORE_DUPS	# Don't push the same directory twice
setopt PUSHD_SILENT		# Don't display directory stack

#ulimit -u 1024

export PATH="$HOME/.bin:$HOME/.cabal/bin:$PATH"

# Import aliases
. ~/.alias
. ~/.shell_functions

# Standard keys
autoload zkbd
[[ ! -f ${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR-$OSTYPE ]] && zkbd
source ${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR-$OSTYPE

[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" beginning-of-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" end-of-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

TRAPUSR1() {
	fc -IW ~/.zsh_histories/`date +%Y.%m.%d.%H.%M.%s`
}

export MAKEFLAGS="-j -l $(grep -c ^processor /proc/cpuinfo)"

# added by Anaconda3 4.2.0 installer
export PATH="$HOME/.anaconda3/bin:$PATH"
