#!/bin/bash

# requirement: git, pip, (patched font)
function check_requirement() {
    messages=()
    for r in "git" "pip"
    do
	[ -z `which $r` ] && messages+=($r)
    done
    if [ ${#messages[@]} -gt 0 ]
    then
	echo "NOT found: ${messages[@]}. Try again after installing the command(s)."
	exit 1;
    fi
}

function install_powerline() {
    [ ! -f ~/.local/bin/powerline ] && pip install --user powerline-status
}

install_powerline

if [ ! -d ~/.src/powerline ];
then
    mkdir -p ~/.src
    cd ~/.src/
    git clone https://github.com/powerline/powerline
fi

cd ~/.src/powerline
git checkout 2.5.2
cd -
