#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

xmodmap -e 'keycode 117='

alias ls='ls --color=auto'
PS1="\[$(tput bold)\]\[\033[38;5;9m\][\[$(tput sgr0)\]\[\033[38;5;10m\]\w\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;9m\]]\[$(tput sgr0)\]$(tput bold)\[\033[38;5;202m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\]\[\033[38;5;226m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
alias ll='ls -la --color=auto'
alias cal='cal -m'

alias sx=startx
alias v=vim
alias p3=python3

alias grep='grep --color=auto'

alias blue="bluetoothctl power on && bluetoothctl"

alias off="systemctl poweroff"
alias reboot="systemctl reboot"
alias pyenv="source venv/bin/activate"
alias mpiexec="mpiexec --mca opal_warn_on_missing_libcuda 0"

alias icat="kitty +kitten icat"

export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
