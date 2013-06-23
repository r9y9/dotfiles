#!/bin/bash

function replace_dotfiles() {
    for file in .*
    do
	if [ $file = "." -o $file = ".." ]
	then
	    continue
	fi
	if [ -e $HOME/$file ]
	then
	    rm -vrf $HOME/$file
	fi
    done

    for file in .*
    do
	if [ $file = "." -o $file = ".." ]
	then
	    continue
	fi
	ln -sv $PWD/$file ${HOME}/$file
    done
}

replace_dotfiles

