# dotfiles

Branch `arch`: Arch Linux + Hyprland, organizado em pacotes de [GNU Stow](https://www.gnu.org/software/stow/).
Branch `wsl2`: Arch no WSL2 (layout plano, sem stow).

## Uso

```bash
git clone -b arch git@github.com:leomp12/dotfiles.git ~/code/leomp12/dotfiles
cd ~/code/leomp12/dotfiles
stow -t ~ zsh bin kitty hypr satty xdg waybar fuzzel dunst yazi claude systemd  # cria os symlinks no $HOME
systemctl --user enable --now claude-tmp-clean.timer wallpaper-rotate.timer
stow -D -t ~ kitty                # desfaz um pacote
```

| Pacote | Conteúdo |
|---|---|
| `zsh` | `.zshrc`, `.profile` (lê `~/.profile.local`, fora do repo), `.p10k.zsh` (p10k via clone em `~/powerlevel10k`) |
| `bin` | `.bin/`: `aur-pkg`, `clear-pacman`, `screenshot`, `wallpaper`, `ssh-unlock` (carrega a chave no ssh-agent do systemd), `unlock-screen` (destrava a tela remotamente via SSH), `screenrecord`, `float-exec` (abre um comando flutuando e centralizado), `claude-tmp-clean` (apaga do `/tmp` os temporários de sessões mortas do Claude Code) |
| `kitty` | `.config/kitty/kitty.conf` |
| `hypr` | `.config/hypr/hyprland.lua` + `hyprpaper.conf` + `hyprlock.conf` + `hypridle.conf` (SUPER+A abre o kitty com o Claude; SUPER+L trava a tela, que também trava após 30 min sem input; SUPER+CTRL+SPACE troca o wallpaper; visual minimalista na paleta navy dos wallpapers: borda sólida #9db4d6 na janela em foco (sem borda quando ela está sozinha no workspace), gaps 2/8; navegador (Firefox/Chromium) dividindo o workspace com outra janela fica com 1560px de largura (1300px de página com o zoom de 120%); DevTools em janela separada abre flutuando, rounding 6, sem sombra; SUPER+SHIFT+M sai do Hyprland, com confirmação; SUPER+SHIFT+setas troca a janela com a vizinha; SUPER+F tela cheia, SUPER+SHIFT+F maximiza mantendo barra e gaps; SUPER+E = yazi (gerenciador de arquivos no terminal; Nautilus fica no launcher); com SHIFT, SUPER+R / Q / E abrem o app / terminal / yazi já flutuando (`float-exec`); Print = menu de screenshot/gravação, Shift+Print / Ctrl+Print = screenshot de janela / tela; SUPER+SHIFT+S = área direto pro clipboard) |
| `satty` | `.config/satty/config.toml` (editor de screenshot) |
| `waybar` | barra; cliques abrem `bluetui`, `nmtui`, `wiremix` flutuando |
| `fuzzel` | lançador (SUPER+R) e seletor do clipboard (SUPER+CTRL+V) |
| `dunst` | notificações (SUPER+, fecha, SUPER+SHIFT+, histórico) |
| `xdg` | `.config/user-dirs.dirs` em kebab-case (`~/downloads`, `~/pictures`...) + `user-dirs.conf` com `enabled=False` |
| `yazi` | `.config/yazi/theme.toml`: moldura na paleta navy; as cores dos arquivos seguem as ANSI do terminal |
| `claude` | `.claude/accounts/gogroup/CLAUDE.md` global (ex.: não usar o `/tmp`, que é RAM, para repos e `node_modules`) |
| `systemd` | units de usuário: `claude-tmp-clean.timer` roda o `claude-tmp-clean` de hora em hora; `wallpaper-rotate.timer` passa para o próximo wallpaper a cada hora |

Dependências (pacman): `zsh zsh-autosuggestions zsh-syntax-highlighting zsh-completions fzf zoxide stow kitty ttf-jetbrains-mono-nerd grim slurp satty wf-recorder wl-clipboard jq xdg-user-dirs waybar fuzzel dunst cliphist hyprpicker hyprlock hypridle udiskie yazi ffmpegthumbnailer poppler fd 7zip imagemagick bluetui wiremix pamixer playerctl`.

## Paleta

Navy, tirada do filtro dos wallpapers. Hyprland, waybar, fuzzel, dunst e yazi usam as mesmas cores:

| | cor | uso |
|---|---|---|
| base | `#0b1628` | fundo da waybar; texto sobre o accent |
| night | `#060b14` | fundo das notificações (75% opaco) |
| panel | `#15233d` | fundo do fuzzel |
| surface | `#2e4570` | hover, seleção do fuzzel |
| dim | `#2a3d61` | borda das janelas inativas, bordas discretas do yazi |
| folder | `#8199bd` | pastas no yazi |
| muted | `#8195b8` | texto apagado |
| text | `#dbe4f2` | texto sobre fundo escuro |
| accent | `#9db4d6` | borda da janela em foco, workspace ativo, prompt e matches |
| urgent | `#e0707a` | urgente/crítico (notificação crítica: fundo `#3a1218`) |

## Wallpapers

As imagens não ficam no repo (licenças de terceiros). `~/.bin/wallpaper` lê de `$(xdg-user-dir PICTURES)/wallpapers/space` e aponta o symlink `~/.cache/wallpaper`, que o `hyprpaper.conf` usa. Fonte: 7 das 10 imagens do tema da comunidade Event Horizon (OldJobobo/omarchy-event-horizon-theme; fora as de astronauta perdido: 02, 03 e 05), escurecidas com um filtro navy:

```sh
# originais em ~/pictures/wallpapers/sources/event-horizon; navy-clut.png = gradiente #000000 -> #10213f -> #9db4d6
magick -size 1x128 gradient:'#000000-#10213f' \( -size 1x128 gradient:'#10213f-#9db4d6' \) -append -resize 1x256\! navy-clut.png
magick orig.jpg -resize '3840x>' -colorspace Gray -gamma 0.85 -colorspace sRGB -type TrueColor navy-clut.png -clut -quality 92 out.jpg
```
