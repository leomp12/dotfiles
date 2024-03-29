if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

# Set default CLI text editor
export EDITOR=nano

# Load nvm with bash completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Shortcut custom bin scripts
export PATH="$PATH:$HOME/.bin"
