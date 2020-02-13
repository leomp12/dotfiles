#
# ~/.zprofile
#

[[ -f ~/.zshrc ]] && . ~/.zshrc

# set default CLI text editor
export EDITOR=nano

# add custom bin paths
export PATH="$PATH:$HOME/.bin:$HOME/.npm-packages/bin"

# scale GUI toolkits
# https://wiki.archlinux.org/index.php/HiDPI
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GDK_DPI_SCALE=1.5

# set Qt5 theme
export QT_STYLE_OVERRIDE=Breeze

# custom mod keys
xmodmap ~/.Xmodmap
