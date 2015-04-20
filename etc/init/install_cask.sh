#!/bin/bash

# Install cask if it's not installed
if [ ! -f ~/.cask/cask.el ]
then
    echo "Install cask..."
    curl -fsSL https://raw.github.com/cask/cask/master/go | python
else
    echo "Cask is already installed."
fi

# Install cask-managed packages
cd ~/.emacs.d
cask install
