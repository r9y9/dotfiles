#!/bin/bash

function replace_dotfiles() {
    # cleaning
    for file in .*
    do
	if [ $file = "." -o $file = ".." -o $file = ".git" -o $file = ".gitignore" ]
	then
	    continue
	fi
	if [ -e $HOME/$file ]
	then
	    rm -rf $HOME/$file
	fi
    done
    # replace files with symbolic link
    for file in .*
    do
	if [ $file = "." -o $file = ".." -o $file = ".git" -o $file = ".gitignore" ]
	then
	    continue
	fi
	ln -sv $PWD/$file $HOME/$file
    done
}

replace_dotfiles
