" lloeki's vimrc

" Bundle loading via vim-plug
source ~/.vim/plugged.vim

scriptencoding "utf-8"

" Security measure
set modelines=0
let g:secure_modelines_leave_modeline=1
let g:secure_modelines_verbose=1

" Prevent .netrwhist creation
let g:netrw_dirhistmax = 0

" Airline
let g:airline_theme='raven'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.whitespace = ''

" Terminal behavior and appearance
if !has('gui_running')
  set showtabline=1           "automatic tab bar
  set mouse=n                 "mouse support
  set background=light
  colorscheme nofrils-light

  "use terminal background
  hi Normal ctermbg=none
  hi todo ctermbg=none
  hi statement ctermbg=none
  hi LineNr ctermbg=none
endif

" Appearance tweaks
hi VertSplit cterm=NONE gui=NONE
set fillchars+=vert:│

" Ignore some files
set wildignore+=*.o,*.obj
set wildignore+=.git,.svn
set wildignore+=,*.pyc,env,venv*
set wildignore+=node_modules
set wildignore+=pkg

" Display more info
set number          "show line numbers in left margin

" Search tweaks
set ignorecase      "ignore case when searching
set smartcase       "... but be nice when actually typing caps

" Tabbing settings
set shiftwidth=4            "indent size
set shiftround              "round indent to next offset
set tabstop=4               "size of tab character
set expandtab               "insert spaces instead of tab
set softtabstop=4           "... and that much spaces are inserted

" Feedback
set hlsearch                "highlight search matches
"set cursorline              "highlight current line
set showmatch               "highlight both matching parentheses
set listchars=eol:¬,tab:→\ ,nbsp:•,trail:·,extends:>,precedes:<
set list                    "display invisible chars

" OS clipboard integration
set clipboard^=unnamed

" Filetype/language specific settings
autocmd FileType make    set noexpandtab   "makefiles need tabs
autocmd FileType ruby    set softtabstop=2 shiftwidth=2
autocmd FileType eruby   set softtabstop=2 shiftwidth=2
autocmd FileType coffee  set softtabstop=4 shiftwidth=4
au      BufRead,BufNewFile Guardfile   setfiletype ruby
au      BufRead,BufNewFile *.skim      setfiletype slim
au      BufRead,BufNewFile *.opal      setfiletype ruby
autocmd FileType go      set nolist

if expand('%:t') =~? 'rfc\d\+' || expand('%:t') =~? 'draft-.*-\d\{2,}'
  setfiletype rfc
  set textwidth=72
endif

" Linters
let g:go_fmt_command = "goimports"
autocmd! BufWritePost * Neomake

" Swap and undo files
set dir=~/.vim/tmp/swap//,/var/tmp//,/tmp//,.
"set undodir=~/.vim/tmp/undo//,.

" Buffer management
set swb=usetab      "make :sb <filename> go to tabs too

" Key mappings
let mapleader = ','

nmap <leader>c :call ToggleQuickfixList()<CR>
nmap <leader>l :call ToggleLocationList()<CR>

nmap <F1> :nohlsearch<CR>
nmap <F5> :set number!<CR>
nmap <F6> :set list!<CR>
inoremap <F5> <C-O>:set number!<CR>
inoremap <F6> <C-O>:set list!<CR>

map <leader>t :NERDTreeToggle<CR>
map <leader>b :CtrlPBuffer<CR>
map <leader>r :CtrlPTag<CR>
map <leader>p :CtrlP<CR>

" Unimpaired remap for non-US keyboard
nmap ( [
nmap ) ]
omap ( [
omap ) ]
xmap ( [
xmap ) ]

" SuperTab options
let g:SuperTabDefaultCompletionType = "context"
" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" Limit popup menu height
set pumheight=10

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" quick task list
command Tasks Ag '(TODO|FIX(?:ME|)|HACK|XXX|OPT(?:IMIZE|)|BUG|WTF|NOTE|CHANGED|REVIEW|IDEA):?\s?(.+$)'

" Restore last known cursor position
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

" Unfold at cursor position
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

" Restore last known cursor position on open
augroup resCur
  autocmd!
  if has("folding")
    autocmd BufWinEnter * if ResCur() | call UnfoldCur() | endif
  else
    autocmd BufWinEnter * call ResCur()
  endif
augroup END

" Restore session if Session.vim exists
function! RestoreSession()
  if argc() == 0 && filereadable("Session.vim") "vim called without arguments
    execute 'source Session.vim'
  end
endfunction
autocmd VimEnter * call RestoreSession()

" Matchit
source $VIMRUNTIME/macros/matchit.vim

" Fix for crontab -e
au! BufNewFile,BufRead crontab.* set nobackup | set nowritebackup

" Term title
set title
set t_ts=]6;
set t_fs=
auto BufEnter * let &titlestring = "file://" . hostname() . expand("%:p")

function! UpdateTags()
  execute ":silent !ctags -R ."
  execute ":redraw!"
  echohl StatusLine | echo "tags updated" | echohl None
endfunction
nnoremap <F8> :call UpdateTags()<CR>

" vim: ft=vim
