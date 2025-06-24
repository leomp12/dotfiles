# dotfiles

My minimal Linux (Arch on WSL2) development setup

Based on https://github.com/yuk7/ArchWSL

## Packages list

```bash
$ pacman -Qe
arch-install-scripts 29-1
base 3-2
base-devel 1-2
fakeroot-tcp 1.34-1
fzf 0.56.3-1
git 2.47.1-1
httpie 3.2.3-1
jq 1.7.1-2
less 1:668-1
level-zero-loader 1.18.5-1
nano 8.2-1
ncdu 2.7-1
neofetch 7.1.0-2
openssh 9.9p1-2
pacman-contrib 1.10.6-2
sudo 1.9.16.p2-1
tree 2.1.3-1
vim 9.1.0866-1
wget 1.25.0-1
zoxide 0.9.6-1
zsh 5.9-5
zsh-autosuggestions 0.7.1-1
zsh-syntax-highlighting 0.8.0-1
```

## Systemd services

```conf
# /etc/systemd/system/tmp.mount.d/override.conf
[Mount]
What=/mnt/c/tmp
Where=/tmp
Type=none
Options=bind
```

## .wslconfig

```conf
[wsl2]
memory=6900MB
```

## Weekly backups

```console
# PowerShell as Administrator
wsl --shutdown
wsl --export Arch C:\Backups\Arch.tar
```
