# dotfiles

My minimal Linux (Ubuntu on WSL1) JS development setup :ok_hand:

## Basic setup

```bash
# pwd = /mnt/c/Users/{me}
$ mkdir ~/.ssh
$ cp .ssh/id_* ~/.ssh/
$ cp .npmrc ~/
$ ln -s ./ ~/desktop
$ ln -s ./Code ~/code
$ cd ~
$ eval "$(ssh-agent -s)"
$ ssh-add
$ sudo apt update
$ sudo apt upgrade
$ sudo apt install zsh
$ sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
$ git config --global --add oh-my-zsh.hide-status 1
$ git config --global --add oh-my-zsh.hide-dirty 1
$ git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
$ git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
# fira code nf should be already installed globally on windows
$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
$ nvm install 14
$ nvm alias default 14
$ nvm install 16
$ nvm use 14
```

## Archlinux

:hammer: My _(g)_ old Arch dotfiles https://github.com/leomp12/dotfiles/tree/archlinux :heartbeat:
