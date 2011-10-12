" lloeki's vimrc

"bundle loading via pathogen
let g:pathogen_disabled = []

filetype off
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible
scriptencoding "utf-8"

"security measure
set modelines=0

" prevent .netrwhist creation
let g:netrw_dirhistmax = 0

"make sure backspace behaves
set backspace=indent,eol,start

if has('gui_running') "GUI specific settings
    
    "better font
    "set guifont=Menlo:h12
    
    "no toolbar
    set guioptions-=T

    set background=light
    "set transparency=8

    "window size
    set columns=90
    set lines=30

else "non-GUI
    set showtabline=1           "automatic tab bar
    set mouse=a                 "mouse support
endif

"color theme
"colorscheme desert
"colorscheme delek
set background=light
let g:solarized_termcolors=16
let g:solarized_visibility="low"
let g:solarized_termtrans=1
colorscheme solarized

"special case fixes
if &term =~ "vt100"
"    let &term="xterm"
endif

if &term =~ "screen"
     "fix for cursor keys in e.g Command-T
     "the one described in :help vt100-cursor-keys does not work
     let &term="xterm"
endif

"if &term =~ "xterm"
"    if has("terminfo")
"        let &t_Co=8
"        let &t_Sf="\e[3%p1%dm"
"        let &t_Sb="\e[4%p1%dm"
"    else
"        let &t_Co=8
"        let &t_Sf="\e[3%dm"
"        let &t_Sb="\e[4%dm"
"    endif
"endif

"ignore some files
set wildignore+=*.o,*.obj,.git,.svn,*.pyc

"display more info
set showmode        "display current mode at the bottom
set showcmd         "display command info at the bottom
set ruler           "display coordinates and relative position at the bottom
set number          "show line numbers in left margin
set laststatus=1


" search tweaks
set incsearch
set ignorecase      "ignore case when searching
set smartcase       "... but be nice when actually typing caps

" tabbing settings
set shiftwidth=4            "indent size
set shiftround              "round indent to next offset
set tabstop=4               "size of tab character
set expandtab               "insert spaces instead of tab
set softtabstop=4           "... and that much spaces are inserted
set smarttab                "tab insertion actually indents on line start
set autoindent              "new line copies indent from above

"feedback
set cursorline              "highlight current line
set showmatch               "highlight both matching parentheses
set listchars=eol:¬,tab:→\ ,nbsp:•,trail:·
set list

"filetype specific settings
autocmd FileType make set noexpandtab   "makefiles need tabs
autocmd FileType ruby set softtabstop=2 shiftwidth=2
autocmd FileType eruby set softtabstop=2 shiftwidth=2

"swap files
"set directory=/var/tmp,.

"buffer management
set swb=usetab      "make :sb <filename> go to tabs too

"key mappings
let mapleader = ','

"Command-T options
"let g:CommandTMatchWindowReverse=1
"let g:CommandTAcceptSelectionTabMap='<CR>'
"let g:CommandTAcceptSelectionMap='<C-r>'

"SuperTab options
let g:SuperTabDefaultCompletionType = "context"

"OmniComplete
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
set completeopt+=longest

"TagBar
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>


"xterm control+arrows
map [1;5D <C-Left>
map! [1;5D <C-Left>
map [1;5C <C-Right>
map! [1;5C <C-Right>
"Terminal.app control+arrows
map [5D <Home>
map! [5D <Home>
map [5C <End>
map! [5C <End>
"Lion Terminal.app option+arrows
map b <M-Left>
map! b <M-Left>
map f <M-Right>
map! f <M-Right>
"Terminal.app option+arrows
map [1;3D <M-Left>
map! [1;3D <M-Left>
map [1;3C <M-Right>
map! [1;3C <M-Right>

" make meta move on words like control
map <M-Left> <C-Left>
map! <M-Left> <C-Left>
map <M-Right> <C-Right>
map! <M-Right> <C-Right>

" highlight background for >80
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/


" restore last known cursor position
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

" unfold at cursor position
if has("folding")
  function! UnfoldCur()
    if !&foldenable
      return
    endif
    let cl = line(".")
    if cl <= 1
      return
    endif
    let cf  = foldlevel(cl)
    let uf  = foldlevel(cl - 1)
    let min = (cf > uf ? uf : cf)
    if min
      execute "normal!" min . "zo"
      return 1
    endif
  endfunction
endif

" restore last known cursor position on open
augroup resCur
  autocmd!
  if has("folding")
    autocmd BufWinEnter * if ResCur() | call UnfoldCur() | endif
  else
    autocmd BufWinEnter * call ResCur()
  endif
augroup END

