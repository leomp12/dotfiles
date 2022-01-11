# Scale GUI toolkits
# https://wiki.archlinux.org/index.php/HiDPI
xrdb -merge ~/.Xresources

# US intl custom mod keys
xmodmap ~/.Xmodmap-us

# Start window manager
exec awesome
