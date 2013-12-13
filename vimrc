" lloeki's vimrc

"bundle loading via vundle
source ~/.vim/bundles.vim

scriptencoding "utf-8"

"security measure
set modelines=0

" prevent .netrwhist creation
let g:netrw_dirhistmax = 0

"make sure backspace behaves
set backspace=indent,eol,start

"shorten esc timeout
set timeout
set timeoutlen=1000
set ttimeoutlen=50

"powerline/airline font
"let g:Powerline_symbols = 'fancy'
"let g:airline_powerline_fonts = 1
"let g:airline_theme='solarized'
"let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'


let g:solarized_visibility="low"
if !has('gui_running') "
    set showtabline=1           "automatic tab bar
    set mouse=a                 "mouse support
    "set background=dark
    "let g:zenburn_force_dark_Background = 1
    "colorscheme zenburn
    "colorscheme candy
    "colorscheme grb256
    "colorscheme github
    "colorscheme codeschool
    "colorscheme distinguished
    "let g:solarized_termtrans=0
    "let g:solarized_termcolors=16
    colorscheme solarized
    "use terminal background
    "hi Normal ctermbg=none
    "hi todo ctermbg=none
    "hi statement ctermbg=none
endif

"ignore some files
set wildignore+=*.o,*.obj,*.pyc
set wildignore+=.git,.svn
set wildignore+=env,venv*

"display more info
set showmode        "display current mode at the bottom
set showcmd         "display command info at the bottom
set ruler           "display coordinates and relative position at the bottom
set number          "show line numbers in left margin
set laststatus=2


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

"OS clipboard integration
set clipboard+=unnamed

"filetype specific settings
autocmd FileType make    set noexpandtab   "makefiles need tabs
autocmd FileType ruby    set softtabstop=2 shiftwidth=2
autocmd FileType eruby   set softtabstop=2 shiftwidth=2
autocmd FileType coffee  set softtabstop=4 shiftwidth=4
au      BufRead,BufNewFile Guardfile setfiletype ruby
au      BufRead,BufNewFile *.skim setfiletype slim
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

"notify line over length
function HighlightOverLength(len)
    highlight OverLength ctermbg=blue ctermfg=white guibg=#59292
    execute 'match OverLength /\%'.(a:len+1).'v.\+/'
endfunction
autocmd FileType vim      call HighlightOverLength(79)
autocmd FileType ruby     call HighlightOverLength(79)
autocmd FileType slim     call HighlightOverLength(79)
autocmd FileType python   call HighlightOverLength(79)
autocmd FileType mdown    call HighlightOverLength(79)

"swap/undo files
set dir=~/.vim/tmp/swap//,/var/tmp//,/tmp//,.
"set undodir=~/.vim/tmp/undo//,.

"buffer management
set swb=usetab      "make :sb <filename> go to tabs too

"key mappings
let mapleader = ','

set hlsearch
map <leader>c :nohlsearch<CR>

map <leader>q :cw<CR>

map <leader>R :source ~/.vimrc<CR>
map <leader>t :NERDTreeToggle<CR>
map <leader>b :CtrlPBuffer<CR>

"coffee
vmap <leader>cc <esc>:'<,'>:CoffeeCompile<CR>
map <leader>cc :CoffeeCompile<CR>
command -nargs=1 C CoffeeCompile | :<args>

"session
nnoremap <leader>S :mksession!<CR>

"Ack
nnoremap <leader>a :Ack<SPACE>

"SuperTab options
let g:SuperTabDefaultCompletionType = "context"

"OmniComplete
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
set completeopt+=longest

"TagBar
"let g:tagbar_usearrows = 1
"nnoremap <leader>l :TagbarToggle<CR>


"xterm control+arrows
"map [1;5D <C-Left>
"map! [1;5D <C-Left>
"map [1;5C <C-Right>
"map! [1;5C <C-Right>
"Terminal.app control+arrows
"map [5D <Home>
"map! [5D <Home>
"map [5C <End>
"map! [5C <End>
"Lion Terminal.app option+arrows
"map b <M-Left>
"map! b <M-Left>
"map f <M-Right>
"map! f <M-Right>
"Terminal.app option+arrows
"map [1;3D <M-Left>
"map! [1;3D <M-Left>
"map [1;3C <M-Right>
"map! [1;3C <M-Right>

" make meta move on words like control
"map <M-Left> <C-Left>
"map! <M-Left> <C-Left>
"map <M-Right> <C-Right>
"map! <M-Right> <C-Right>

" highlight background for >80
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

" conserve undo info
"set undofile

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

" restore session if Session.vim exists
function! RestoreSession()
  if argc() == 0 && filereadable("Session.vim") "vim called without arguments
    execute 'source Session.vim'
  end
endfunction
autocmd VimEnter * call RestoreSession()

" relative line numbers
"function! NumberToggle()
"  if(&relativenumber == 1)
"    set norelativenumber
"  else
"    set relativenumber
"  endif
"endfunc
"
"nnoremap <C-n> :call NumberToggle()<cr>
"
":au FocusLost * :set norelativenumber
":au FocusGained * :set relativenumber
"
"autocmd InsertEnter * :set norelativenumber
"autocmd InsertLeave * :set relativenumber

"matchit
source $VIMRUNTIME/macros/matchit.vim

" vim: ft=vim
