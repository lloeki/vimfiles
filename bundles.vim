set nocompatible
set shell=bash
filetype on
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/argtextobj.vim'
Bundle 'tpope/vim-bundler'
Bundle 'kchmck/vim-coffee-script'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/glsl.vim'
Bundle 'jnwhiteh/vim-golang'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'groenewege/vim-less'
Bundle 'gkz/vim-ls'
Bundle 'tpope/vim-markdown'
Bundle 'edsono/vim-matchit'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'timcharper/textile.vim'
Bundle 'jnurmine/Zenburn'
Bundle 'mattn/zencoding-vim'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'slim-template/vim-slim'

filetype plugin indent on
syntax on
