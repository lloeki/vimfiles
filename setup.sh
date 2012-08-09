#!/bin/sh

[ $(pwd) = "$HOME/.vim" ] || ln -sfn "$(pwd)" "$HOME/.vim"
ln -sfn "$HOME/.vim/rc" "$HOME/.vimrc"

