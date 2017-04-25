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

# CUDA
export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"

# SPTK speech signal processing toolkit
export PATH="/usr/local/SPTK/bin:$PATH"

# Go (assumed that golang manually installed)
export PATH="/usr/local/go/bin:$PATH"
export GOROOT="/usr/local/go/"

# Go workspace settings
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Rust
# racer (Rust Code Completion utility) needs to know the place of **src**
export RUST_SRC_PATH="$HOME/rust/src"

# Haskell
export PATH="$HOME/.cabal/bin:$PATH"

# Anaconda
export PATH="$HOME/anaconda3/bin:$HOME/anaconda/bin:$PATH"

# Cask
export PATH="$HOME/.cask/bin:$PATH"

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
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

LISTMAX=1000

## completion configuration
fpath=($HOME/.zsh/functions/Completion ${fpath})
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

# Peco
[ -f $HOME/.zsh.d/peco.zshrc ] && source $HOME/.zsh.d/peco.zshrc

# syntax highlighting
source ~/.zsh.d/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Setup zsh-autosuggestions

autosuggestions=~/.zsh.d/plugins/zsh-autosuggestions/autosuggestions.zsh
if [ -e $autosuggestions ]; then
    source $autosuggestions
fi

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^T' autosuggest-toggle

# Accept suggestions without leaving insert mode
bindkey '^f' vi-forward-word

## load environmental .zshrc configuration file
case "${OSTYPE}" in
darwin*)
    [ -f $HOME/.zsh.d/zshrc.osx ] && source $HOME/.zsh.d/zshrc.osx
    ;;
linux*)
    [ -f $HOME/.zsh.d/zshrc.linux ] && source $HOME/.zsh.d/zshrc.linux
    ;;
msys*)
    [ -f $HOME/.zsh.d/zshrc.msys ] && source $HOME/.zsh.d/zshrc.msys
    ;;
esac
