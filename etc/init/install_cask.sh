#!/bin/bash

if [ ! -e ~/.cask/cask.el ]
then
    curl -fsSL https://raw.github.com/cask/cask/master/go | python
fi

