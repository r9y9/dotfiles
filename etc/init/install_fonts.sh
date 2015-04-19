#!/bin/bash

# Requirement: wget, unzip, git and fontforge
function check_requirement() {
    messages=()
    for r in "wget" "unzip" "git" "fontforge"
    do
	[ -z `which $r` ] && messages+=($r)
    done
    if [ ${#messages[@]} -gt 0 ]
    then
	echo "NOT found: ${messages[@]}. Try again after installing the command(s)."
	exit 1;
    fi
}

# Install directory
[ ! -d ~/.fonts ] && mkdir -p ~/.fonts/

# MigMix 1P
function install_migumix-1p() {
    wget -O migmix.zip "http://sourceforge.jp/frs/redir.php?m=jaist&f=%2Fmix-mplus-ipa%2F59021%2Fmigmix-1p-20130617.zip"
    unzip -o migmix.zip -d migmix
    find migmix -name "*.ttf" | xargs -i mv -vf {} ~/.fonts
    rm -rf migmix*
}

# Migu 1M
function install_migu-1m() {
    wget -O migu-1m.zip "http://sourceforge.jp/frs/redir.php?m=jaist&f=%2Fmix-mplus-ipa%2F59022%2Fmigu-1m-20130617.zip"
    unzip -o migu-1m.zip -d migu-1m
    find migu-1m -name "*.ttf" | xargs -i mv -vf {} ~/.fonts
    rm -rf migu-1m*
}

# Inconsolata
function install_inconsolata() {
    wget -O Inconsolata.otf "http://levien.com/type/myfonts/Inconsolata.otf"
    mv -vf Inconsolata.otf ~/.fonts
}

# Ricty
# Migu-1m and Inconsolata must be installed in advance
function install_ricty() {
    git clone https://github.com/yascentur/Ricty.git
    sh Ricty/ricty_generator.sh auto
    mv -vf Ricty*.ttf ~/.fonts
    rm -rf Ricty
}

# Powerline symbols
function install_powerline_symbols() {
    wget -O PowerlineSymbols.otf "https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf"
    mv -vf PowerlineSymbols.otf ~/.fonts/

    wget -O 10-powerline-symbols.conf "https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf"
    [ ! -d ~/.config/fontconfig/conf.d/ ] && mkdir -p ~/.config/fontconfig/conf.d/
    mv -vf 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
}

# Ricty for powerline
function install_ricty_for_powerline() {
    wget -O powerline-fontpatcher "https://raw.githubusercontent.com/powerline/fontpatcher/develop/scripts/powerline-fontpatcher"
    wget -O fontpatcher-symbols.sfd "https://raw.githubusercontent.com/powerline/fontpatcher/develop/fonts/powerline-symbols.sfd"

    fontforge -script powerline-fontpatcher --source-font ./fontpatcher-symbols.sfd ~/.fonts/Ricty-Regular.ttf
    mv -vf Ricty*.ttf ~/.fonts
    rm -f powerline-fontpatcher
    rm -f fontpatcher-symbols.sfd
}

function install_roboto() {
    mkdir roboto
    wget -O roboto/roboto.zip "https://developer.android.com/downloads/design/Roboto_Hinted_20120823.zip"
    unzip roboto/roboto.zip -d roboto/
    mv -vf roboto/*.ttf ~/.fonts
    rm -rf roboto
}

check_requirement

install_migumix-1p
install_migu-1m
install_inconsolata
install_ricty
install_powerline_symbols
install_ricty_for_powerline
install_roboto

fc-cache -fv ~/.fonts
