export EDITOR=nano

# Shortcut custom executables
# ~/.local/bin (claude, uv, etc.) antes de tudo: o greetd lê este arquivo, então vale para o Hyprland
export PATH="$HOME/.local/bin:$PATH:$HOME/.bin"

# Claude Code: conta padrão (ecom aposentada em 2026-10)
export CLAUDE_CONFIG_DIR="$HOME/.claude/accounts/gogroup"

bindkey "^[[3~" delete-char

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
[ -f .nvmrc ] && command -v nvm >/dev/null && nvm use

export PNPM_HOME="/home/leo/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# Skip warnings with pnpm-specific fields on .npmrc
export npm_config_loglevel=error

# ssh-agent do systemd (ssh-agent.socket), sem expiração; ver ~/.bin/ssh-unlock
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
if [[ -t 0 ]] && ! ssh-add -l &>/dev/null; then
  ~/.bin/ssh-unlock
fi
