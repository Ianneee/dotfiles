setxkbmap it &
sxhkd &

# Status bar
dwmstatus 2>&1 >/dev/null &

# Wallpaper
~/.fehbg &

exec dwm
