" lloeki's vimrc

"bundle loading via vundle
source ~/.vim/bundles.vim

scriptencoding "utf-8"

"security measure
set modelines=0
let g:secure_modelines_leave_modeline=1
let g:secure_modelines_verbose=1

" prevent .netrwhist creation
let g:netrw_dirhistmax = 0

"airline
let g:airline_theme='raven'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.whitespace = ''

"terminal behavior and appearance
if !has('gui_running')
    set showtabline=1           "automatic tab bar
    set mouse=n                 "mouse support
    set background=dark
    colorscheme eink

    "use terminal background
    hi Normal ctermbg=none
    hi todo ctermbg=none
    hi statement ctermbg=none
endif

"appearance tweaks
hi VertSplit cterm=NONE gui=NONE
set fillchars+=vert:│

"ignore some files
set wildignore+=*.o,*.obj,*.pyc
set wildignore+=.git,.svn
set wildignore+=env,venv*
set wildignore+=node_modules

"display more info
set number          "show line numbers in left margin

" search tweaks
set ignorecase      "ignore case when searching
set smartcase       "... but be nice when actually typing caps

" tabbing settings
set shiftwidth=4            "indent size
set shiftround              "round indent to next offset
set tabstop=4               "size of tab character
set expandtab               "insert spaces instead of tab
set softtabstop=4           "... and that much spaces are inserted

"feedback
"set cursorline              "highlight current line
set showmatch               "highlight both matching parentheses
set listchars=eol:¬,tab:→\ ,nbsp:•,trail:·,extends:>,precedes:<
set list

"OS clipboard integration
set clipboard^=unnamed

"filetype/language specific settings
autocmd FileType make    set noexpandtab   "makefiles need tabs
autocmd FileType ruby    set softtabstop=2 shiftwidth=2
autocmd FileType eruby   set softtabstop=2 shiftwidth=2
autocmd FileType coffee  set softtabstop=4 shiftwidth=4
au      BufRead,BufNewFile Guardfile setfiletype ruby
au      BufRead,BufNewFile *.skim setfiletype slim
au      BufRead,BufNewFile *.opal setfiletype ruby
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_javascript_checkers = ['eslint']
let g:go_fmt_command = "goimports"

if expand('%:t') =~? 'rfc\d\+' || expand('%:t') =~? 'draft-.*-\d\{2,}'
    setfiletype rfc
    set textwidth=72
endif

"notify line over length
function HighlightOverLength(len)
    highlight OverLength ctermbg=blue ctermfg=white guibg=#59292
    execute 'match OverLength /\%'.(a:len+1).'v.\+/'
endfunction
autocmd FileType vim      call HighlightOverLength(80)
autocmd FileType ruby     call HighlightOverLength(80)
autocmd FileType slim     call HighlightOverLength(80)
autocmd FileType python   call HighlightOverLength(80)
autocmd FileType mdown    call HighlightOverLength(80)

"swap/undo files
set dir=~/.vim/tmp/swap//,/var/tmp//,/tmp//,.
"set undodir=~/.vim/tmp/undo//,.

"buffer management
set swb=usetab      "make :sb <filename> go to tabs too

"key mappings
let mapleader = ','

set hlsearch
map <leader>c :nohlsearch<CR>

map <leader>t :NERDTreeToggle<CR>
map <leader>b :CtrlPBuffer<CR>
map <leader>r :CtrlPTag<CR>
map <leader>p :CtrlP<CR>

nmap ( [
nmap ) ]
omap ( [
omap ) ]
xmap ( [
xmap ) ]

"SuperTab options
let g:SuperTabDefaultCompletionType = "context"
" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" Limit popup menu height
set pumheight=10

"OmniComplete
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
set completeopt+=longest

" quick task list
command Tasks Ag '(TODO|FIX(?:ME|)|HACK|XXX|OPT(?:IMIZE|)|BUG|WTF|NOTE|CHANGED|REVIEW|IDEA):?\s?(.+$)'

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

"matchit
source $VIMRUNTIME/macros/matchit.vim

"crontab -e
au! BufNewFile,BufRead crontab.* set nobackup | set nowritebackup

" vim: ft=vim
