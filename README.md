# dotfiles

Branch `arch`: Arch Linux + Hyprland, organizado em pacotes de [GNU Stow](https://www.gnu.org/software/stow/).
Branch `wsl2`: Arch no WSL2 (layout plano, sem stow).

## Uso

```bash
git clone -b arch git@github.com:leomp12/dotfiles.git ~/code/leomp12/dotfiles
cd ~/code/leomp12/dotfiles
stow -t ~ zsh bin kitty hypr satty xdg waybar fuzzel dunst claude systemd  # cria os symlinks no $HOME
systemctl --user enable --now claude-tmp-clean.timer
stow -D -t ~ kitty                # desfaz um pacote
```

| Pacote | Conteúdo |
|---|---|
| `zsh` | `.zshrc`, `.profile` (lê `~/.profile.local`, fora do repo), `.p10k.zsh` (p10k via clone em `~/powerlevel10k`) |
| `bin` | `.bin/`: `aur-pkg`, `clear-pacman`, `screenshot`, `wallpaper`, `ssh-unlock` (carrega a chave no ssh-agent do systemd), `unlock-screen` (destrava a tela remotamente via SSH), `screenrecord`, `claude-tmp-clean` (apaga do `/tmp` os temporários de sessões mortas do Claude Code) |
| `kitty` | `.config/kitty/kitty.conf` |
| `hypr` | `.config/hypr/hyprland.lua` + `hyprpaper.conf` + `hyprlock.conf` + `hypridle.conf` (SUPER+A abre o kitty com o Claude; SUPER+L trava a tela, que também trava após 30 min sem input; SUPER+CTRL+SPACE troca o wallpaper; SUPER+SHIFT+M sai do Hyprland, com confirmação; Print = menu de screenshot/gravação, Shift+Print / Ctrl+Print = screenshot de janela / tela; SUPER+SHIFT+S = área direto pro clipboard) |
| `satty` | `.config/satty/config.toml` (editor de screenshot) |
| `waybar` | barra; cliques abrem `bluetui`, `nmtui`, `wiremix` flutuando |
| `fuzzel` | lançador (SUPER+R) e seletor do clipboard (SUPER+CTRL+V) |
| `dunst` | notificações (SUPER+, fecha, SUPER+SHIFT+, histórico) |
| `xdg` | `.config/user-dirs.dirs` em kebab-case (`~/downloads`, `~/pictures`...) + `user-dirs.conf` com `enabled=False` |
| `claude` | `.claude/accounts/gogroup/CLAUDE.md` global (ex.: não usar o `/tmp`, que é RAM, para repos e `node_modules`) |
| `systemd` | units de usuário: `claude-tmp-clean.timer` roda o `claude-tmp-clean` de hora em hora |

Dependências (pacman): `zsh zsh-autosuggestions zsh-syntax-highlighting zsh-completions fzf zoxide stow kitty ttf-jetbrains-mono-nerd grim slurp satty wf-recorder wl-clipboard jq xdg-user-dirs waybar fuzzel dunst cliphist hyprpicker hyprlock hypridle udiskie bluetui wiremix pamixer playerctl`.

## Wallpapers

As imagens não ficam no repo (licenças de terceiros). `~/.bin/wallpaper` lê de `$(xdg-user-dir PICTURES)/wallpapers/space` e aponta o symlink `~/.cache/wallpaper`, que o `hyprpaper.conf` usa. Fontes: temas `starship` e `ethereal` do Omarchy, e os temas da comunidade Event Horizon (OldJobobo), Mars (steve-lohmeyer, MIT) e Pulsar (bjarneo).
