# dotfiles

Branch `arch`: Arch Linux + Hyprland no `leo-arch-dev`, organizado em pacotes de [GNU Stow](https://www.gnu.org/software/stow/).
Branch `wsl2`: Arch no WSL2 (layout plano, sem stow).

## Uso

```bash
git clone -b arch git@github.com:leomp12/dotfiles.git ~/code/leomp12/dotfiles
cd ~/code/leomp12/dotfiles
stow -t ~ zsh bin kitty hypr satty xdg waybar fuzzel dunst  # cria os symlinks no $HOME
stow -t ~ claude                  # (pendente) CLAUDE.md global (CLAUDE_CONFIG_DIR=~/.claude/accounts/gogroup)
stow -D -t ~ kitty                # desfaz um pacote
```

| Pacote | Conteúdo |
|---|---|
| `zsh` | `.zshrc`, `.profile`, `.p10k.zsh` (p10k via clone em `~/powerlevel10k`) |
| `bin` | `.bin/`: `aur-pkg`, `clear-pacman`, `claude-gogroup`, `screenshot`, `wallpaper`, `ssh-unlock` (carrega a chave no ssh-agent do systemd) |
| `kitty` | `.config/kitty/kitty.conf` |
| `hypr` | `.config/hypr/hyprland.lua` + `hyprpaper.conf` (SUPER+A abre o kitty com o Claude; SUPER+CTRL+SPACE troca o wallpaper; Print / Shift+Print / Ctrl+Print = screenshot de região / janela / tela) |
| `satty` | `.config/satty/config.toml` (editor de screenshot) |
| `waybar` | barra; cliques abrem `bluetui`, `nmtui`, `wiremix` flutuando |
| `fuzzel` | lançador (SUPER+R) e seletor do clipboard (SUPER+CTRL+V) |
| `dunst` | notificações (SUPER+, fecha, SUPER+SHIFT+, histórico) |
| `xdg` | `.config/user-dirs.dirs` em kebab-case (`~/downloads`, `~/pictures`...) + `user-dirs.conf` com `enabled=False` |
| `claude` | `.claude/accounts/gogroup/CLAUDE.md` (pendente: ainda não versionado) |

Dependências (pacman): `zsh zsh-autosuggestions zsh-syntax-highlighting zsh-completions fzf zoxide stow kitty ttf-jetbrains-mono-nerd grim slurp satty wl-clipboard jq xdg-user-dirs waybar fuzzel dunst cliphist hyprpicker udiskie bluetui wiremix pamixer playerctl`.

## Wallpapers

As imagens não ficam no repo (licenças de terceiros). `~/.bin/wallpaper` lê de `$(xdg-user-dir PICTURES)/wallpapers/space` e aponta o symlink `~/.cache/wallpaper`, que o `hyprpaper.conf` usa. Fontes: temas `starship` e `ethereal` do Omarchy, e os temas da comunidade Event Horizon (OldJobobo), Mars (steve-lohmeyer, MIT) e Pulsar (bjarneo).
