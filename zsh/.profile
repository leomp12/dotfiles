export EDITOR=nano

# Shortcut custom executables
# ~/.local/bin (claude, uv, etc.) antes de tudo: o greetd lê este arquivo, então vale para o Hyprland
export PATH="$HOME/.local/bin:$PATH:$HOME/.bin"

# Configuração local fora do repo (ex.: CLAUDE_CONFIG_DIR)
[ -f "$HOME/.profile.local" ] && . "$HOME/.profile.local"

bindkey "^[[3~" delete-char

# Runtimes (node/pnpm/bun) via mise: shims resolvem a versão pelo cwd (.nvmrc,
# packageManager) a cada execução. Sem `mise activate`: hooks de cd não rodam no
# Bash tool do Claude Code, shims funcionam igual para humano e agent.
export PATH="$HOME/.local/share/mise/shims:$PATH"

# Globais do `bun add -g`
export BUN_INSTALL="$HOME/.bun"
export PATH="$PATH:$BUN_INSTALL/bin"

export PNPM_HOME="/home/leo/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# Skip warnings with pnpm-specific fields on .npmrc
export npm_config_loglevel=error

# ssh-agent do systemd (ssh-agent.socket), sem expiração; ver ~/.bin/ssh-unlock
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
# no boot (greetd) não pede: travaria o startup no tty1; o Hyprland abre o ssh-unlock na tela
if [[ -t 0 ]] && [[ $(cat /proc/$PPID/comm 2>/dev/null) != greetd ]] && ! ssh-add -l &>/dev/null; then
  ~/.bin/ssh-unlock
fi
