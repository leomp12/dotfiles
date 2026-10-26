# dotfiles

Branch `arch`: Arch Linux + Hyprland, organizado em pacotes de [GNU Stow](https://www.gnu.org/software/stow/).
Branch `wsl2`: Arch no WSL2 (layout plano, sem stow).

## Uso

```bash
git clone -b arch git@github.com:leomp12/dotfiles.git ~/code/leomp12/dotfiles
cd ~/code/leomp12/dotfiles
stow -t ~ zsh bin kitty hypr satty xdg waybar fuzzel dunst yazi vicinae fontconfig claude systemd herdr  # cria os symlinks no $HOME
systemctl --user enable --now claude-tmp-clean.timer wallpaper-rotate.timer
stow -D -t ~ kitty                # desfaz um pacote
```

| Pacote | Conteúdo |
|---|---|
| `zsh` | `.zshrc`, `.profile` (lê `~/.profile.local`, fora do repo), `.p10k.zsh` (p10k via clone em `~/powerlevel10k`) |
| `bin` | `.bin/`: `aur-pkg`, `clear-pacman`, `screenshot`, `wallpaper`, `ssh-unlock` (carrega a chave no ssh-agent do systemd), `unlock-screen` (destrava a tela remotamente via SSH), `screenrecord`, `float-exec` (abre um comando flutuando e centralizado), `vicinae-launch` (prefixo de launch do Vicinae: abre o app normal ou flutuando, conforme o atalho), `claude-here` (abre o Claude Code num kitty na pasta dada, com o ambiente da sessão do Hyprland), `claude-pick` (lista de pastas no fzf, num kitty flutuante, para o `herdr-open`), `herdr-open` (traz a janela do herdr, ou abre um kitty com ele; com uma pasta, cria nela um workspace com o Claude Code; funciona também por SSH, base do `cc` do branch `wsl2`), `claude-tmp-clean` (apaga do `/tmp` os temporários de sessões mortas do Claude Code), `claude-rc` e `claude-rc-setup` (servidores do Remote Control, ver `systemd`) |
| `kitty` | `.config/kitty/kitty.conf` |
| `hypr` | `.config/hypr/hyprland.lua` + `hyprpaper.conf` + `hyprlock.conf` + `hypridle.conf` (SUPER+A escolhe uma pasta e abre o Claude Code nela, num workspace do herdr; SUPER+H traz a janela do herdr; SUPER+R / SUPER+SHIFT+R = lista de apps do Vicinae, abrindo o app normal / flutuando; SUPER+SPACE = busca completa do Vicinae; SUPER+V = histórico do clipboard; SUPER+. = emojis; SUPER+T alterna flutuante/tiled; SUPER+L trava a tela, que também trava após 30 min sem input; SUPER+CTRL+SPACE troca o wallpaper; visual minimalista na paleta navy dos wallpapers: borda sólida #9db4d6 na janela em foco (sem borda quando ela está sozinha no workspace), gaps 2/8; navegador (Firefox/Chromium) dividindo o workspace com outra janela fica com 1560px de largura (1300px de página com o zoom de 120%); DevTools em janela separada abre flutuando, rounding 6, sem sombra; SUPER+SHIFT+M sai do Hyprland, com confirmação; SUPER+SHIFT+setas troca a janela com a vizinha; SUPER+F tela cheia, SUPER+SHIFT+F maximiza mantendo barra e gaps; SUPER+E = yazi (gerenciador de arquivos no terminal; Nautilus fica no launcher); com SHIFT, SUPER+Q / E abrem o terminal / yazi já flutuando (`float-exec`); Print = menu de screenshot/gravação, Shift+Print / Ctrl+Print = screenshot de janela / tela; SUPER+SHIFT+S = área direto pro clipboard) |
| `satty` | `.config/satty/config.toml` (editor de screenshot) |
| `waybar` | barra; cliques abrem `bluetui`, `nmtui`, `wiremix` flutuando |
| `fuzzel` | menus pequenos (screenshot no Print, confirmação do SUPER+SHIFT+M); não depende de servidor rodando |
| `dunst` | notificações (SUPER+, fecha, SUPER+SHIFT+, histórico) |
| `xdg` | `.config/user-dirs.dirs` em kebab-case (`~/downloads`, `~/pictures`...) + `user-dirs.conf` com `enabled=False` |
| `yazi` | `.config/yazi/theme.toml`: moldura na paleta navy; as cores dos arquivos seguem as ANSI do terminal |
| `vicinae` | launcher [Vicinae](https://github.com/vicinaehq/vicinae) (AUR `vicinae-bin`; o servidor sobe como `vicinae.service` no start do Hyprland): apps, arquivos, calculadora, clipboard. `.config/vicinae/dotfiles.jsonc` (telemetria e favicons externos desligados, tema, fonte, layer shell) é importado pelo `settings.json`, que a GUI reescreve e fica fora do repo junto com as pastas excluídas da busca de arquivos. Tema `navy.toml`; scripts `Ask Claude`, `Claude Code in Folder` (resolve a pasta pelo zoxide) e `Search Google` |
| `fontconfig` | `.config/fontconfig/fonts.conf`: `sans-serif` e `system-ui` = Adwaita Sans (a Inter do GNOME, mesma fonte da UI do GTK), com Noto Sans de fallback; serif e mono seguem as Noto do sistema |
| `claude` | `.claude/CLAUDE.md` global (ex.: não usar o `/tmp`, que é RAM, para repos e `node_modules`); `.local/share/applications/claude-code.desktop` ("Abrir com → Claude Code" para pastas, no Nautilus e no Vicinae; precisa do `~/.bin` no PATH da sessão e de um padrão para pastas, senão vira o handler delas: `xdg-mime default org.gnome.Nautilus.desktop inode/directory`); com `CLAUDE_CONFIG_DIR`, ligue `ln -s ~/.claude/CLAUDE.md "$CLAUDE_CONFIG_DIR/CLAUDE.md"` |
| `systemd` | units de usuário: `claude-tmp-clean.timer` roda o `claude-tmp-clean` de hora em hora; `wallpaper-rotate.timer` passa para o próximo wallpaper a cada hora; `claude-rc@<nome>.service` é um servidor do Remote Control por linha de `~/.config/claude-rc/servers`, arquivo local fora do git, criado a partir do `servers.example` (rode `claude-rc-setup` depois de editar a lista; sobem no boot via linger) |
| `herdr` | `.config/herdr/config.toml` (só o config; sessão, logs e sockets ficam fora): worktrees em `~/code/_worktrees`, título da sessão do Claude Code na sidebar de agentes; atalhos `Alt+↑/↓` troca de space, `Alt+1..9` troca de aba, `Alt+←/→` e `Alt+Tab` mudam o foco entre panes, `Alt+Q` abre um split com shell, `Alt+A` abre um split com o Claude Code (`herdr-open --split`), `Ctrl+b n` cria space, `Ctrl+b t` cria aba sem pedir nome; moldura nos panes mesmo quando a aba tem um só |

Dependências (pacman): `zsh zsh-autosuggestions zsh-syntax-highlighting zsh-completions fzf zoxide stow kitty ttf-jetbrains-mono-nerd grim slurp satty wf-recorder wl-clipboard jq xdg-user-dirs waybar fuzzel dunst hyprpicker hyprlock hypridle udiskie yazi ffmpegthumbnailer poppler fd 7zip imagemagick bluetui wiremix pamixer playerctl`.

## Paleta

Navy, tirada do filtro dos wallpapers. Hyprland, waybar, fuzzel, Vicinae, dunst e yazi usam as mesmas cores:

| | cor | uso |
|---|---|---|
| base | `#0b1628` | fundo da waybar; texto sobre o accent |
| night | `#060b14` | fundo das notificações (75% opaco) |
| panel | `#15233d` | fundo do fuzzel e do Vicinae |
| surface | `#2e4570` | hover, seleção do fuzzel e do Vicinae |
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
