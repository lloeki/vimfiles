#!/bin/sh

[ "${PWD}" = "$HOME/.vim" ] || ln -sfn "${PWD}" "$HOME/.vim"

vim -u plugged.vim +PlugInstall +qall
