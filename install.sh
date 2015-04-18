#!/bin/bash

files=(
    ".bash_profile"
    ".bashrc"
    ".bashrc.msys"
    ".emacs"
    ".emacs.d"
    ".gitconfig"
    ".hgrc"
    ".tmux.conf"
    ".tmux.d"
    ".zsh.d"
    ".zshrc"
    ".vimrc"
)

function replace_dotfiles() {
    # cleaning
    for file in ${files[@]}
    do
	if [ -e $HOME/$file ]
	then
	    rm -rf $HOME/$file
	fi
    done
    # replace files with symbolic link
    for file in ${files[@]}
    do
	ln -sv $PWD/$file $HOME/$file
    done
}

replace_dotfiles
