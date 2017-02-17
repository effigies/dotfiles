#
# default .bashrc
# 03/31/13
#
# Source global definitions

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ "$TERM" = "rxvt-unicode-256color" ]; then
    TERM="rxvt-unicode"
fi

RS="\[\033[0m\]"    # reset
for cmap in BLK:0 RED:1 GRN:2 YEL:3 BLU:4 MAG:5 CYN:6 WHT:7; do
    color="${cmap:0:3}"
    cnum="${cmap:4}"
    eval PR_$color='"\[\033[01;3${cnum}m\]"'
    eval PR_L$color='"\[\033[3${cnum}m\]"'
done

SET_TITLE="\[\033]0;\u@\h:\w\a\]"
USER="$PR_GRN\u@\h$RS"
PTY="${PR_BLU}pts/\l$RS"
WD="$PR_WHT\w$RS"
function prompt_cmd
{
    RET=$?
    if [ $RET = 0 ]; then
        STATUS="$PR_LGRN[$RET]$RS"
    else
        STATUS="$PR_LRED[$RET]$RS"
    fi
    export PS1="$SET_TITLE$USER.$PTY$STATUS:$WD% "
}
export PROMPT_COMMAND=prompt_cmd

. ~/.alias
. ~/.shell_functions
