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

" OS clipboard integration
set clipboard^=unnamed

" Terminal title
if has('macunix') && $TERM_PROGRAM ==# 'Apple_Terminal'
  set title
  set t_ts=]6;
  set t_fs=
  if !exists('autocmd_terminal_title')
    let autocmd_terminal_title = 1
    augroup TermTitle
      autocmd BufEnter,BufRead * let &titlestring = "file://" . hostname() . expand("%:p")
    augroup END
  endif
else
  set title
  augroup TermTitle
    autocmd BufEnter,BufRead * let &titlestring = expand("%:p")
  augroup END
endif

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

function! DetectMode()
    if has('macunix') && $TERM_PROGRAM ==# 'Apple_Terminal'
      let s:mode = system('defaults read -g AppleInterfaceStyle')
      if v:shell_error
        set background=light
      else
        set background=dark
      endif
    endif
endfunction

function! UseTermBG()
    "use terminal background
    if has('nvim')
      hi Normal ctermbg=none guibg=none
      hi todo ctermbg=none guibg=none
      hi statement ctermbg=none guibg=none
      hi LineNr ctermbg=none guibg=none
    else
      hi Normal ctermbg=none
      hi todo ctermbg=none
      hi statement ctermbg=none
      hi LineNr ctermbg=none
    endif
endfunction

function! ApplyMode()
    " set theme
    if &background ==# 'light'
      colorscheme habamax
    else
      colorscheme habamax
    endif

    call UseTermBG()
endfunction

" Terminal behavior and appearance
if !has('gui_running')
  set showtabline=1           "automatic tab bar
  set mouse=n                 "mouse support
  if has('mouse_sgr')
      set ttymouse=sgr
  end

  if $SSH_CLIENT
    colorscheme habamax
    call UseTermBG()
  else
    call DetectMode()
    call ApplyMode()
  endif
endif

augroup Lumen
  autocmd User LumenLight call ApplyMode()
  autocmd User LumenDark call ApplyMode()
augroup END

" Appearance tweaks
hi VertSplit cterm=NONE gui=NONE
set fillchars+=vert:│

" Linters
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_virtualtext_cursor = 0
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_ruby_steep_executable = 'bundle'
let g:ale_ruby_standardrb_executable = 'bundle'
let g:go_fmt_command = 'goimports'
"let g:ale_linters = {'ruby': ['standardrb']}
"let g:ale_fixers = { 'python': ['black'], 'ruby': ['standardrb'] }
"let g:ale_fix_on_save = 1

let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc

" Ignore some files
set wildignore+=*.o,*.obj
set wildignore+=.git,.svn
set wildignore+=*.pyc,env,venv*
set wildignore+=node_modules
set wildignore+=pkg
set wildignore+=vendor

" Display more info
"set number          "show line numbers in left margin

" Search tweaks
set ignorecase      "ignore case when searching
set smartcase       "... but be nice when actually typing caps

" Invisibles
set listchars=eol:¬,tab:→\ ,nbsp:•,trail:·,extends:>,precedes:<
set list                    "display invisible chars

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

" Swap and undo files
set directory=~/.vim/tmp/swap//,/var/tmp//,/tmp//,.
"set undodir=~/.vim/tmp/undo//,.

" Buffer management
set switchbuf=usetab      "make :sb <filename> go to tabs too

" SuperTab options
let g:SuperTabDefaultCompletionType = 'context'
" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" Limit popup menu height
set pumheight=10

" Key mappings
let mapleader = ','

" Useful panels
nmap <leader>c :call ToggleQuickfixList()<CR>
nmap <leader>l :call ToggleLocationList()<CR>

nmap <F1> :nohlsearch<CR>
nmap <F5> :set number!<CR>
nmap <F6> :set list!<CR>
inoremap <F5> <C-O>:set number!<CR>
inoremap <F6> <C-O>:set list!<CR>

" Diff before save
nmap <leader>d :w !diff -u % -<CR>

" Zen mode
nmap <leader>z :set nolist<CR>:Goyo<CR>

" Code navigation
map <leader>t :Sexplore<CR>
map <leader>b :Buffers<CR>
map <leader>r :Tags<CR>
map <leader>p :Files<CR>

" Terminal remap for non-US keyboard
"tnoremap <C-b> <C-\>

" Unimpaired remap for non-US keyboard
"nmap ( [
"nmap ) ]
"omap ( [
"omap ) ]
"xmap ( [
"xmap ) ]

" vim terminal sensible keys

" go to normal mode (leave with i)
tnoremap <C-b> <C-\><C-n>

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" organ
if ! exists('g:organ_loaded')
  let g:organ_config = {}
  let g:organ_config.speedkeys = 1
endif

" quick task list
command Tasks Ag '(TODO|FIX(?:ME|)|HACK|XXX|OPT(?:IMIZE|)|BUG|WTF|NOTE|CHANGED|REVIEW|IDEA):?\s?(.+$)'

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.\*']

" Restore last known cursor position
function! ResCur()
  if &filetype ==# 'netrw'
    return 0
  endif
  if line("'\"") <= line('$')
    normal! g`"
    return 1
  endif
endfunction

"fix netrw gx brokenness: https://github.com/vim/vim/issues/4738
if has('macunix')
  function! OpenURLUnderCursor()
    let s:uri = matchstr(getline('.'), '[a-z]*:\/\/[^ >,;()]*')
    let s:uri = shellescape(s:uri, 1)
    if s:uri !=# ''
      silent exec "!open '".s:uri."'"
      :redraw!
    endif
  endfunction
  nnoremap gx :call OpenURLUnderCursor()<CR>
endif

" Unfold at cursor position
if has('folding')
  function! UnfoldCur()
    if !&foldenable
      return
    endif
    let cl = line('.')
    if cl <= 1
      return
    endif
    let cf  = foldlevel(cl)
    let uf  = foldlevel(cl - 1)
    let min = (cf > uf ? uf : cf)
    if min
      execute 'normal!' min . 'zo'
      return 1
    endif
  endfunction
endif

" Restore last known cursor position on open
augroup resCur
  autocmd!
  if has('folding')
    autocmd BufWinEnter * if ResCur() | call UnfoldCur() | endif
  else
    autocmd BufWinEnter * call ResCur()
  endif
augroup END

function! ShellcheckDetect(buffer)
  for l:line_num in [1, 2, 3]
    let l:line = get(getbufline(a:buffer, l:line_num), 0, '')

    if l:line[:11] is# '# shellcheck'
      let l:command = l:line
      for l:possible_shell in ['bash', 'dash', 'ash', 'tcsh', 'csh', 'zsh', 'ksh', 'sh']
        if l:command =~# l:possible_shell . '\s*$'
          return l:possible_shell
        endif
      endfor
    endif
  endfor

  return ''
endfunction

function! ShellcheckSet(buffer)
  let l:shell = ShellcheckDetect(a:buffer)
  if l:shell ==# 'bash'
    call setbufvar(a:buffer, 'is_bash', 1)
  else
    call setbufvar(a:buffer, 'is_bash', 0)
  endif
endfunction

" Filetype/language specific settings
augroup vimrc
  autocmd FileType make                  setl noexpandtab
  autocmd FileType ruby                  setl softtabstop=2 shiftwidth=2
  autocmd FileType eruby                 setl softtabstop=2 shiftwidth=2
  autocmd FileType coffee                setl softtabstop=4 shiftwidth=4
  autocmd BufRead,BufNewFile Guardfile   setf ruby
  autocmd BufRead,BufNewFile Steepfile   setf ruby
  autocmd BufRead,BufNewFile Vagrantfile setf ruby
  autocmd BufRead,BufNewFile Steepfile   setf ruby
  autocmd BufRead,BufNewFile *.skim      setf slim
  autocmd BufRead,BufNewFile *.opal      setf ruby
  autocmd FileType go                    setl nolist
  autocmd FileType sh                    call ShellcheckSet(bufnr("%"))
  autocmd! BufNewFile,BufRead crontab.*  setl nobackup | setl nowritebackup   " Fix for crontab -e
augroup END

" Formatting
function! FormatJSON()
  execute ":'<,'>! jq"
endfunction
map <leader>fj :call FormatJSON()<CR>

function! FormatColumnize()
  execute "'<,'>! column -t"
endfunction
map <leader>fc :call FormatColumnize()<CR>

function! FormatSort()
  execute "'<,'>! sort"
endfunction
map <leader>fs :call FormatSort()<CR>

" Go tools path
let g:go_bin_path = expand('$HOME') . '/.local/libexec/go/bin'

if expand('%:t') =~? 'rfc\d\+' || expand('%:t') =~? 'draft-.*-\d\{2,}'
  setfiletype rfc
  setl textwidth=72
endif

map <leader>s :mksession!<CR>
" Restore session if Session.vim exists
"function! RestoreSession()
"  if argc() == 0 && filereadable('Session.vim') "vim called without arguments
"    "let answer = confirm('foo?', '&Yes\nNo', 1)
"    execute 'source Session.vim'
"  end
"endfunction
"autocmd VimEnter * call RestoreSession()

" Matchit
source $VIMRUNTIME/macros/matchit.vim

function! UpdateTags()
  execute ':silent !ctags -R .'
  execute ':redraw!'
  echohl StatusLine | echo 'tags updated' | echohl None
endfunction
nnoremap <F8> :call UpdateTags()<CR>

" project local vim config
function! LocalInit()
  let s:local_config_allowed = []
  let s:local_config_allowed_file = expand('~/.vim/localvim')
  if filereadable(s:local_config_allowed_file)
    let s:local_config_allowed = readfile(s:local_config_allowed_file)
  endif

  let s:local_config_basename = '.local.vim'

  let s:local_config_file = getcwd() . '/' . s:local_config_basename

  if filereadable(s:local_config_file)
    if index(s:local_config_allowed, s:local_config_file) < 0
      echo 'local config file disallowed: ' . s:local_config_file
    else
      call LocalLoad()
    endif
  endif
endfunction

function! LocalLoad()
  execute 'source' s:local_config_file
endfunction

function! LocalAllow()
  call add(s:local_config_allowed, s:local_config_file)
  call writefile(uniq(sort(s:local_config_allowed)), s:local_config_allowed_file)
  call LocalLoad()
endfunction

call LocalInit()

command LocalAllow call LocalAllow()

" vim: ft=vim
