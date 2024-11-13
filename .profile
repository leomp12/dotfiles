if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

export EDITOR=nano

# Shortcut custom bin scripts
export PATH="$PATH:$HOME/.bin"

# pnpm
export PNPM_HOME="/home/leo/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# bun
[ -s "/home/leo/.bun/_bun" ] && source "/home/leo/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
