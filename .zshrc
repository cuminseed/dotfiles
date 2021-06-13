
HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U compinit promptinit
compinit
promptinit
prompt adam1

#PROMPT="%n@%m: %~ %# "
PROMPT="%m: %~ %# "

setopt share_history
setopt extended_history
setopt append_history
setopt print_eight_bit
setopt auto_cd
setopt auto_pushd
setopt correct
setopt pushd_ignore_dups
setopt pushd_ignore_dups
setopt no_beep

function chpwd() { ls -F }
function cdup() {
echo
cd ..
zle reset-prompt
}
zle -N cdup
#bindkey '\{' cdup

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

[[ -s ${HOME}/.autojump/etc/profile.d/autojump.sh ]] && source ${HOME}/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=1


autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^p' history-beginning-search-backward-end
bindkey '^n' history-beginning-search-forward-end

# exports
export LANG=ja_JP.UTF-8
export EDITOR=vim
export VIEWER=vim
export SVN_EDITOR=vim
export TERM=xterm-color
export PATH="${PATH}:${HOME}/.local/bin"
#export TERM=xterm-256color
#export TERM=xterm
export GMOCK_DIR=${HOME}/docs/program/googletest/googlemock
export GTEST_DIR=${HOME}/docs/program/googletest/googletest

# aliases
alias p=popd
alias d='pwd'
alias irisn='grep -Irins'
alias irins='grep -Irins'
alias mc='mc -a --colors normal=white,default:selected=default,blue:marked=yellow,default:markselect=yellow,gray:directory=blue,default:executable=brightgreen,default:link=cyan,default:device=brightmagenta,default:special=lightgray,default:errors=red,default:reverse=green,default:gauge=green,default:input=white,gray:dnormal=green,gray:dfocus=brightgreen,gray:dhotnormal=cyan,gray:dhotfocus=brightcyan,gray:menu=green,default:menuhot=cyan,default:menusel=green,gray:menuhotsel=cyan,default:helpnormal=cyan,default:editnormal=green,default:editbold=blue,default:editmarked=gray,blue:stalelink=red,default'
alias qui='exit'
alias quit='exit'
alias :q='exit'
alias :qa='exit'
alias history='history -f'
alias his='history -f'
alias vi='vim'
alias emacs='emacs -nw'
alias tm="tmux"

case "${OSTYPE}" in
darwin*)
alias ls='ls -G'
alias ll='ls -alFG'
;;
linux*)
alias ls='ls --color=auto'
alias ll='ls -alrtF --color=auto'
;;
esac

source `pacman -Ql z | grep z.sh | awk '{ print $2 }'`

if [ -z "$TMUX" ]; then
	tmux
fi

