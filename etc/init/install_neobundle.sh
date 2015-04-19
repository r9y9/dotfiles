#!/bin/bash

if [ ! -e ~/.vim/bundle ]
then
    echo "Install NeoBundle..."
    curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
else
    echo "NeoBundle is already installed."
fi
