#!/bin/bash

DOTFILES_PATH=~/.dotfiles
BASH_SRC_PATH=$DOTFILES_PATH/bash

. "$BASH_SRC_PATH"/.prompt
. "$BASH_SRC_PATH"/.aliases
. "$BASH_SRC_PATH"/.functions

# System Specific
if [[ ! "$SSH_TTY" && "$OSTYPE" =~ ^darwin ]]; then
	. "$BASH_SRC_PATH"/.osx
else
	. "$BASH_SRC_PATH"/.ubuntu
fi

# edit this folder
alias dot="cd ~/.dotfiles"
# reload
alias rl="source ~/.bashrc; echo '~/.bashrc reloaded.'"