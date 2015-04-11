# ~/.zshrc file for zsh(1)

## environmental variables configurations
# LANG
export LANG=ja_JP.UTF-8
case ${UID} in
0)
    LANG=C
    ;;
esac

# Local path settings
export PATH="$HOME/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/lib:/usr/local/opt/llvm/lib:$LD_LIBRARY_PATH"

# SPTK speech signal processing toolkit
export PATH="/usr/local/SPTK/bin:$PATH"

# Go
export PATH="/usr/local/go/bin:$PATH"
export GOROOT="/usr/local/go/"

# Go workspace settings
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Go appengine SDK
export PATH="$GOPATH/go_appengine:$PATH"

# Haskell
export PATH="$HOME/.cabal/bin:$PATH"

# PyLearn2
export PYLEARN2_DATA_PATH=$HOME/data
export PYLEARN2_VIEWER_COMMAND="eog --new-instance"

## additional userful functions
# auto change directory
setopt auto_cd
function chpwd() { ls }

# auto directory pushd that you can get dirs list by cd -[tab]
setopt auto_pushd

# command correct edition before each completion attempt
setopt correct

# compacked complete list display
setopt list_packed

# no remove postfix slash of command line
setopt noautoremoveslash

# no beep sound when complete list displayed
setopt nolistbeep

# magic complete
setopt magic_equal_subst

## keybind configuration
#
# emacs like keybind (e.x. Ctrl-a gets to line head and Ctrl-e gets
#   to end) and something additions
#
bindkey -e
bindkey "^[[1~" beginning-of-line # Home gets to line head
bindkey "^[[4~" end-of-line # End gets to line end
bindkey "^[[3~" delete-char # Del

# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# reverse menu completion binded to Shift-Tab
bindkey "\e[Z" reverse-menu-complete

# emacs-like forward/backward word with ctrl+left/right
bindkey '5D' emacs-backward-word
bindkey '5C' emacs-forward-word
export WORDCHARS=""

## command history configuration
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

## completion configuration
fpath=(${HOME}/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit

# zsh editor
autoload zed

# expand aliases before completing
setopt complete_aliases     # aliased ls needs if file/dir completions work

## terminal configuration
case "${TERM}" in
screen)
    TERM=xterm
    ;;
esac

case "${TERM}" in
xterm|xterm-color)
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm-color)
    stty erase '^H'
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm)
    stty erase '^H'
    ;;
cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
jfbterm-color)
    export LSCOLORS=gxFxCxdxBxegedabagacad
    export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac

# set terminal title including current directory
case "${TERM}" in
xterm|xterm-color|kterm|kterm-color)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

## ZSH prompt configuration
autoload colors
colors

# set vcs (version control systems) info
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
VCS_PROMPT_INFO="%1(v|%F{green}%1v%f|)"

# left prompt
ZSH_PREFIX_CHAR="🍺"
ZSH_PREFIX="%{$fg_bold[cyan]%}${ZSH_PREFIX_CHAR} %{${reset_color}%}"
PROMPT=""
PROMPT+="%{$fg_bold[white]%}[%{$fg_bold[green]%}%n%{${reset_color}%}"
PROMPT+="%{$fg_bold[white]%}@%{${reset_color}%}"
PROMPT+="%{$fg_bold[cyan]%}%m%{$fg_bold[white]%}] %{${reset_color}%}"
PROMPT+="%{$fg[cyan]%}%/ %{${reset_color}%}"
PROMPT+="%{$fg_bold[white]%}%% %{${reset_color}%}"

# right prompt
RPROMPT="%{$fg_bold[cyan]%}${VCS_PROMPT_INFO}%{$fg_bold[blue]%}%{${reset_color}%}"

# sucessive prompt
PROMPT2="%{${fg[green]}%}%_%%%{${reset_color}%} "

# typo
SPROMPT="%{${fg[white]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "

# ssh connection emphasis
if [ -n "${REMOTEHOST}${SSH_CONNECTION}" ]
then
    PROMPT="%{${fg_bold[yellow]}%}SSH: ${PROMPT}"
fi

# with prefix
PROMPT="${ZSH_PREFIX} ${PROMPT}"

## aliases
alias where="command -v"
alias j="jobs -l"

# ls with color
case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -la"
alias  l="ls -l"
alias du="du -h"
alias df="df -h"
alias su="su -l"
alias gl="git pull"

## Go home
alias gh="cd $GOPATH"

## Dropbox home
alias gd="cd $HOME/Dropbox"

## load environmental .zshrc configuration file
case "${OSTYPE}" in
# mac
darwin*)
    [ -f ${HOME}/.zsh.d/zshrc.mac ] && source ${HOME}/.zsh.d/zshrc.mac
    ;;
linux*)
    [ -f ${HOME}/.zsh.d/zshrc.linux ] && source ${HOME}/.zsh.d/zshrc.linux
    ;;
esac

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Peco
[ -f ${HOME}/.zsh.d/peco.zshrc ] && source ${HOME}/.zsh.d/peco.zshrc

# Anaconda
export PATH="$HOME/anaconda/bin:$PATH"

#
# Goolge Search by Google Chrome
# terminalからググったりqiita検索をできる
#
google() {
    local str opt
    if [ $# != 0 ]; then
	for i in $*; do
	    # $strが空じゃない場合、検索ワードを+記号でつなぐ(and検索)
	    str="$str${str:++}$i"
	done
	opt='search?num=100'
	opt="${opt}&q=${str}"
    fi
    open -a Google\ Chrome http://www.google.co.jp/$opt
}

qiita() {
    local str opt
    if [ $# != 0 ]; then
	for i in $*; do
	    # $strが空じゃない場合、検索ワードを+記号でつなぐ(and検索)
	    str="$str${str:++}$i"
	done
	opt='search?num=100'
	opt="${opt}&q=${str}"
    fi
    open -a Google\ Chrome http://qiita.com/$opt
}
