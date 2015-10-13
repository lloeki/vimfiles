" OSX settings
if has("gui_macvim")

" key bindings
macmenu File.Print key=<nop>

"map <D-S-left>        :macaction _cycleWindowsBackwards:<CR>
"map <D-S-right>       :macaction _cycleWindows:<CR>
nnoremap <D-S-left>   :tabprevious<CR>
nnoremap <D-S-right>  :tabnext<CR>
nnoremap <D-p>        :CtrlP<CR>
"nnoremap <D-b>        :CtrlPBuffer<CR>

" better font
set guifont=Source\ Code\ Pro:h14

set noballooneval

endif  " OSX

" no menu
set guioptions-=m

" no toolbar
set guioptions-=T

" no tear-off menus
set guioptions-=t

" no scrollbars
set guioptions-=L
set guioptions-=r
set guioptions-=b

set background=light
"let g:airline_theme="light"
"let g:airline_theme="sol"
"let g:solarized_visibility="low"
"colorscheme solarized
"let g:zenburn_force_dark_Background = 1
"colorscheme zenburn
"colorscheme codeschool
"colorscheme github
"colorscheme twilight
"colorscheme candy
set background=light
colorscheme one-light

"window size
set columns=90
set lines=30

set showtabline=2           "always on tab bar
