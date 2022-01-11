# Session keyring
# https://unix.stackexchange.com/a/295652/332452
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
# https://wiki.archlinux.org/title/GNOME/Keyring#xinitrc
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
# https://github.com/NixOS/nixpkgs/issues/14966#issuecomment-520083836
mkdir -p "$HOME"/.local/share/keyrings

# Scale GUI toolkits
# https://wiki.archlinux.org/index.php/HiDPI
xrdb -merge ~/.Xresources

# US intl custom mod keys
xmodmap ~/.Xmodmap-us

# Start window manager
exec awesome
