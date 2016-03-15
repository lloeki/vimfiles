set nocompatible
set shell=bash
filetype on
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-sensible'

Bundle 'altercation/vim-colors-solarized'
Bundle 'jnurmine/Zenburn'
Bundle 'endel/vim-github-colorscheme'
Bundle 'flazz/vim-colorschemes'
Bundle 'lloeki/vim-one-colorschemes'
Bundle 'https://bitbucket.org/kisom/eink.vim.git'

Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'

Bundle 'ciaranm/securemodelines'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'rking/ag.vim'

Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-scripts/glsl.vim'
Bundle 'fatih/vim-go'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-markdown'
Bundle 'slim-template/vim-slim'
Bundle 'jboyens/vim-protobuf'
Bundle 'dag/vim-fish'
Bundle 'vim-scripts/rfc-syntax'
Bundle 'rust-lang/rust.vim'

Bundle 'vim-scripts/argtextobj.vim'
Bundle 'michaeljsmith/vim-indent-object'

Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-unimpaired'

filetype plugin indent on
syntax on
