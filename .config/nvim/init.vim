" An example for a vimrc file.
"
" To use it, copy it to
"     for Unix:     $HOME/.config/nvim/init.vim
"     for Windows:  %LOCALAPPDATA%\nvim\init.vim

set backup             " keep a backup file (restore to previous version)
set backupdir=/home/gyok/.nvim/backup//
set directory=/home/gyok/.nvim/backup//
set undofile           " keep an undo file (undo changes after closing)
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set smartindent
"set foldenable
set exrc
set secure
set number
"set foldmethod=indent
set undofile
set undodir=~/.config/nvim/undo/
set undolevels=1000
set undoreload=10000
setlocal path+=/home/gyok/program/build/cocos2d-x-3.14.1/cocos/

" Don't use Ex mode, use Q for formatting
noremap Q gq

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_server_python_interpreter = '/usr/bin/python2'
let g:ycm_global_ycm_extra_conf = '/home/gyok/program/project/test/.ycm_extra_conf.py'
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

nmap <F8> :TagbarOpenAutoClose<CR>
nmap <F9> :NERDTreeToggle<CR>
nmap <F5> :GundoToggle<CR>
nmap <C-T> gt

if &compatible
	  set nocompatible
endif
call plug#begin('/home/gyok/.config/nvim/plugins')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Valloric/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/vim-niji'
Plug 'mhartington/oceanic-next'
Plug 'sjl/gundo.vim'
Plug 'davidhalter/jedi-vim'
Plug 'mhinz/vim-startify'
Plug 'tomtom/tcomment_vim'
Plug 'nightsense/seagrey'
call plug#end()
filetype plugin indent on
filetype plugin on
syntax on

let g:airline_theme='oceanicnext'
let g:airline_powerline_fonts = 1
" +--RainBow Lauchen
let g:rainbow_active = 1
let g:rainbow_conf = {
	\	'guifgs': ['#368360', '#353d82', '#82356f', '#826335', '#398235'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}
" ---RainBow Lauchen
" Switch syntax highlighting on
"colorscheme OceanicNext
colorscheme seagrey-light
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'textwidth' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

augroup END

	"+--Oceanic next theme"
	" For Neovim 0.1.3 and 0.1.4
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	
	" Or if you have Neovim >= 0.1.5
	if (has("termguicolors"))
	 set termguicolors
	endif
	
	"---Oceanic next theme"
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
                 \ | wincmd p | diffthis
endif
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END
