set nocompatible
set shell=bash
filetype on
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'
"Bundle 'Lokaltog/vim-distinguished'
Bundle 'jnurmine/Zenburn'
Bundle 'endel/vim-github-colorscheme'
Bundle 'flazz/vim-colorschemes'
"Bundle 'tomasr/molokai'
"Bundle 'nanotech/jellybeans'
"Bundle 'chriskempson/tomorrow-theme'

Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'
Bundle 'rking/ag.vim'

Bundle 'ciaranm/securemodelines'
Bundle 'kien/ctrlp.vim'
"Bundle 'Lokaltog/vim-powerline'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
"Bundle 'majutsushi/tagbar'
"Bundle 'airblade/vim-gitgutter'

Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-scripts/glsl.vim'
Bundle 'fatih/vim-go'
Bundle 'groenewege/vim-less'
"Bundle 'gkz/vim-ls'
Bundle 'tpope/vim-markdown'
"Bundle 'timcharper/textile.vim'
Bundle 'slim-template/vim-slim'
Bundle 'jboyens/vim-protobuf'
Bundle 'dag/vim-fish'
Bundle 'vim-scripts/rfc-syntax'

Bundle 'vim-scripts/argtextobj.vim'
Bundle 'michaeljsmith/vim-indent-object'

Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
"Bundle 'tpope/vim-ragtag'
"Bundle 'tpope/vim-speeddating'
"Bundle 'mattn/zencoding-vim'
"Bundle 'scrooloose/nerdcommenter'
"Bundle 'Raimondi/delimitMate'
Bundle 'edsono/vim-matchit'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-eunuch'

filetype plugin indent on
syntax on
