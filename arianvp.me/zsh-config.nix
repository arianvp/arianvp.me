with import <nixpkgs> {};

pkgs.writeText "zshrc" ''
export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/

ZSH_THEME="gentoo"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR=${pkgs.vim}/bin/vim
bindkey -v

''
