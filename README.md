# dotfiles

Branch `arch`: Arch Linux + Hyprland no `leo-arch-dev`, organizado em pacotes de [GNU Stow](https://www.gnu.org/software/stow/).
Branch `wsl2`: Arch no WSL2 (layout plano, sem stow).

## Uso

```bash
git clone -b arch git@github.com:leomp12/dotfiles.git ~/code/leomp12/dotfiles
cd ~/code/leomp12/dotfiles
stow -t ~ zsh bin kitty hypr satty xdg  # cria os symlinks no $HOME
stow -t ~ claude                  # CLAUDE.md global (CLAUDE_CONFIG_DIR=~/.claude/accounts/gogroup)
stow -D -t ~ kitty                # desfaz um pacote
```

| Pacote | Conteúdo |
|---|---|
| `zsh` | `.zshrc`, `.profile`, `.p10k.zsh` (p10k via clone em `~/powerlevel10k`) |
| `bin` | `.bin/`: `aur-pkg`, `clear-pacman`, `claude-gogroup`, `screenshot` |
| `kitty` | `.config/kitty/kitty.conf` |
| `hypr` | `.config/hypr/hyprland.lua` (SUPER+A abre o kitty com o Claude; Print / Shift+Print / Ctrl+Print = screenshot de região / janela / tela) |
| `satty` | `.config/satty/config.toml` (editor de screenshot) |
| `xdg` | `.config/user-dirs.dirs` em kebab-case (`~/downloads`, `~/pictures`...) + `user-dirs.conf` com `enabled=False` |
| `claude` | `.claude/accounts/gogroup/CLAUDE.md` |

Dependências (pacman): `zsh zsh-autosuggestions zsh-syntax-highlighting zsh-completions fzf zoxide stow kitty ttf-jetbrains-mono-nerd grim slurp satty wl-clipboard jq xdg-user-dirs`.
