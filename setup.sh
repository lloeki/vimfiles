#!/bin/sh

[ $(pwd) = "$HOME/.vim" ] || ln -sfn "$(pwd)" "$HOME/.vim"
ln -sfn "$HOME/.vim/gvimrc" "$HOME/.gvimrc"
ln -sfn "$HOME/.vim/vimrc" "$HOME/.vimrc"

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
