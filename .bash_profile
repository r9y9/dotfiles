case "${OSTYPE}" in
msys*)
    if hash zsh 2>/dev/null; then
	# msys2 doesn't ship with chsh.. so manualy exec zsh
	exec zsh --login
    else
	[ -f ~/.bashrc ] && . ~/.bashrc
    fi
    ;;
*)
    [ -f ~/.bashrc ] && . ~/.bashrc
    ;;
esac
