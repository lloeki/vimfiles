call plug#begin('~/.vim/plugged')

" Sensible defaults
Plug 'tpope/vim-sensible'

" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'jnurmine/Zenburn'
Plug 'endel/vim-github-colorscheme'
Plug 'flazz/vim-colorschemes'
Plug 'lloeki/vim-one-colorschemes'
Plug 'rakr/vim-one'
Plug 'https://bitbucket.org/kisom/eink.vim.git'
Plug 'robertmeta/nofrils'
Plug 'whatyouhide/vim-gotham'
Plug 'olivertaylor/vacme'

" External tool integration
Plug 'tpope/vim-bundler'      " bundler + gem-ctags
Plug 'tpope/vim-fugitive'     " git
Plug 'jremmen/vim-ripgrep'    " rg is the new ag is the new ack

" UI extensions
Plug 'ciaranm/securemodelines'          " safe modelines in files
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'              , { 'on': 'NERDTreeToggle' }
Plug 'ervandew/supertab'                " completion
Plug 'w0rp/ale'                         " linter checks
Plug 'milkypostman/vim-togglelist'      " toggle quickfix and location lists
Plug 'junegunn/goyo.vim'                " distraction-free writing

" Languages
Plug 'kchmck/vim-coffee-script'   , { 'for': 'coffee' }
Plug 'vim-scripts/glsl.vim'       , { 'for': 'glsl' }
Plug 'fatih/vim-go'              ", { 'for': 'go', 'do': ':GoInstallBinaries' }
"Plug 'nsf/gocode'                , { 'for': 'go', 'rtp': 'vim' }
Plug 'groenewege/vim-less'        , { 'for': 'less' }
Plug 'tpope/vim-markdown'        ", { 'for': ['md', 'mdown', 'markdown'] }
Plug 'slim-template/vim-slim'     , { 'for': 'slim' }
Plug 'jboyens/vim-protobuf'       , { 'for': 'proto' }
Plug 'dag/vim-fish'               , { 'for': 'fish' }
Plug 'vim-scripts/rfc-syntax'     , { 'for': 'rfc' }
Plug 'rust-lang/rust.vim'        ", { 'for': ['rs', 'rust'] }

" Text objects
Plug 'vim-scripts/argtextobj.vim'           " arguments
Plug 'michaeljsmith/vim-indent-object'      " indentation

" Extensions
Plug 'junegunn/vim-easy-align'              " alignment
Plug 'tpope/vim-repeat'                     " extend `.`
Plug 'tpope/vim-surround'                   " surround
Plug 'tpope/vim-commentary'                 " comments
Plug 'tpope/vim-endwise'                    " extend `%`
Plug 'tpope/vim-eunuch'                     " unix helpers
Plug 'tpope/vim-unimpaired'                 " next/prev

call plug#end()
