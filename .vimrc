" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif


" =============================================================================
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')


" A Vim Plugin for Lively Previewing LaTeX PDF Output
"Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
"let g:livepreview_previewer = '/usr/local/bin/zathura'
"set updatetime=100

"Plug 'PietroPate/vim-tex-conceal'
set conceallevel=2
let g:tex_conceal="abdgms"

Plug 'lervag/vimtex'
let g:tex_flavor='latex'
"let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode=1
"
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
"If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"Coloring 
Plug 'joshdick/onedark.vim'
"Plug 'sheerun/vim-polyglot'



" Tab help??
Plug 'ervandew/supertab'


Plug 'donRaphaco/neotex', { 'for': 'tex' }
let g:neotex_enabled = 2
"let g:neotex_latexdiff = 0
let g:neotex_delay = 4444
"let g:tex_flavor = 'latex'

"Plug 'ycm-core/YouCompleteMe'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
"let g:ycm_use_ultisnips_completer = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
	


"List ends here. Plugins become visible to Vim after this call.
call plug#end()
" =============================================================

set cursorline

"Use the coloring
syntax on
colorscheme onedark

" Ruler down the side
set number



"Spelling Ctrl-L
setlocal spell
set spelllang=en_au
imap <F2> <c-g>u<Esc>[s1z=`]a<c-g>u 
nmap <F2> [s1z=<c-o>



" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

let $BASH_ENV = "~/.bash_aliases"

"Open master file
"nmap <C-A> :! zathura ../master.pdf & <CR><CR> 



let g:vimtex_compiler_callback_hooks = ['MyTestHook']
function! MyTestHook(status)
 echom a:status
endfunction


"For diagrams"
"let g:vimtex_compiler_engine='laulatex' 
"
