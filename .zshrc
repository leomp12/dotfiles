#
# ~/.zshrc
#

# setup for NPM global packages
# unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if already modifying MANPATH elsewhere
export MANPATH="$HOME/.npm-packages/share/man:$(manpath)"

# load NVM
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

# many tweaks and advanced optimizations from grml with grml-zsh-config pkg
# same as Arch ISO

#
# -- DO NOT EDIT BELOW --
#

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/leo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
