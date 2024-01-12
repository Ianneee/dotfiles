# If not running interactively, don't do anything
[[ $- != *i* ]] && return

xmodmap -e 'keycode 117='

PS1="\[\033[38;5;198m\]\u\[$(tput sgr0)\]\[\033[38;5;201m\]@\[$(tput sgr0)\]\[\033[38;5;135m\]\h \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;9m\][\[$(tput sgr0)\]\[\033[38;5;10m\]\w\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;9m\]]\[$(tput sgr0)\]\[\033[38;5;9m\][\[$(tput sgr0)\]\t\[$(tput sgr0)\]\[\033[38;5;9m\]]\[$(tput sgr0)\]$(tput bold)\[\033[38;5;202m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ <\1>/')\[$(tput sgr0)\]\[\033[38;5;226m\]\n\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

alias ls='ls --color=auto'
alias ll='ls -la -h --color=auto'
alias l="ll"

alias cal='cal -m'
alias sx=startx
alias v=nvim
alias p3=python3
alias ..="cd .."

alias grep='grep --color=auto'

alias blue="bluetoothctl power on && bluetoothctl"

alias off="systemctl poweroff"
alias reboot="systemctl reboot"

alias pyenv="source venv/bin/activate"

alias mpiexec="mpiexec --mca opal_warn_on_missing_libcuda 0"

alias icat="kitty +kitten icat"

alias listen_chillhop="mpv --no-video https://www.youtube.com/live/7NOSDKb0HlU?si=YUczwsLRf5riojRA"
alias listen_lofigirl="mpv --no-video https://www.youtube.com/live/jfKfPfyJRdk?si=trCjd2csT44cL5QY"
alias listen_trancentral="mpv --no-video https://www.youtube.com/live/EEA7F96lJkU?si=H9qyVl7EFX80czYJ"

export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'

alias g="git"
alias ga="git add"
alias gs="git status"
alias gss="git status -s"
alias gc="git commit"
alias gcm="git commit -m"
alias gp="git push"
alias gpo="git push origin"

alias keyboardlayout="setxkbmap it"

source /home/ian/.config/broot/launcher/bash/br
