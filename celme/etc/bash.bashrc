#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
PS2='> '
PS3='> '
PS4='+ '

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
                                                        
    ;;
  screen)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    ;;
esac

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

export LESS_TERMCAP_mb=$'\E[01;31m' \
LESS_TERMCAP_md=$'\E[01;38;5;74m' \
LESS_TERMCAP_me=$'\E[0m' \
LESS_TERMCAP_se=$'\E[0m' \
LESS_TERMCAP_so=$'\E[38;5;246m' \
LESS_TERMCAP_ue=$'\E[0m' \
LESS_TERMCAP_us=$'\E[04;38;5;146m'

alias ls="ls --color=auto"
alias dir="dir --color=auto"
alias grep="grep --color=auto"
alias dmesg='dmesg --color'
