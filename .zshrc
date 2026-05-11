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

source ~/powerlevel10k/powerlevel10k.zsh-theme

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

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

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

export PATH="$HOME/.local/bin:$PATH"
