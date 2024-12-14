# dotfiles

My minimal Linux (Arch on WSL2) development setup

Based on https://github.com/yuk7/ArchWSL

## Packages list

```bash
$ pacman -Qet
arch-install-scripts 29-1
base 3-2
fzf 0.56.3-1
httpie 3.2.3-1
jq 1.7.1-2
nano 8.2-1
neofetch 7.1.0-2
wget 1.25.0-1
zsh-autosuggestions 0.7.1-1
zsh-syntax-highlighting 0.8.0-1
```

## Weekly backups

```console
# PowerShell as Administrator
wsl --export Arch C:\Backups\Arch.tar
```
