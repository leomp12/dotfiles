export EDITOR=nano

# Shortcut custom executables
export PATH="$PATH:$HOME/.bin"

bindkey "^[[3~" delete-char

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
[ -f .nvmrc ] && nvm use

export PNPM_HOME="/home/leo/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  ssh-agent -t 4h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
  source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi
if ! ssh-add -l &>/dev/null; then
  ssh-add 2>/dev/null
fi
