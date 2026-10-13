# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=90000
SAVEHIST=20000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/leo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/.profile

# powerlevel10k: clone manual (git clone --depth=1 https://github.com/romkatv/powerlevel10k ~/powerlevel10k)
[[ -f ~/powerlevel10k/powerlevel10k.zsh-theme ]] && source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Fuzzy finder with ctrl+r, ctrl+t, ctrl+i
source <(fzf --zsh)

# `z` for better `cd` with autojump
eval "$(zoxide init zsh)"

# bun completions
[ -s "/home/leo/.bun/_bun" ] && source "/home/leo/.bun/_bun"

# Hábito do nvm em cima do mise (shims leem MISE_NODE_VERSION):
# `nvm use 18` fixa na sessão, `nvm use` volta ao .nvmrc/padrão
nvm() {
  case "$1" in
    use) if [[ -n "$2" ]]; then export MISE_NODE_VERSION="$2"; else unset MISE_NODE_VERSION; fi; node -v ;;
    ls) mise ls node ;;
    install) mise install "node@${2:?versão}" ;;
    current) node -v ;;
    *) echo "nvm é um atalho para o mise: use|ls|install|current" >&2; return 1 ;;
  esac
}

# Claude Code fullscreen renderer on the local desktop only (not over SSH or inside tmux)
[[ -z "$SSH_CONNECTION" && -z "$TMUX" ]] && export CLAUDE_CODE_NO_FLICKER=1

# Multiple Claude Code accounts/config with .clauderc
claude() {
  local config_file=".clauderc"
  if [[ -f "$PWD/$config_file" ]]; then
    local cmd=$(cat "$PWD/$config_file" | tr -d '[:space:]')
    eval "$cmd" "$@"
  else
    command claude "$@"
  fi
}

