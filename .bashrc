#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Start ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

xmodmap -e 'keycode 117='

export TERM=xterm-256color
export PATH="$HOME/.local/bin:$PATH:$HOME/Scripts"

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias ll='ls -la --color=auto'
alias cal='cal -m'

alias sx=startx
alias v=vim
alias p3=python3

alias grep='grep --color=auto'

alias blue="bluetoothctl power on && bluetoothctl"

alias off="systemctl poweroff"
alias reboot="systemctl reboot"

