" An example for a vimrc file.
"
" To use it, copy it to
"     for Unix:     $HOME/.config/nvim/init.vim
"     for Windows:  %LOCALAPPDATA%\nvim\init.vim

set backup             " keep a backup file (restore to previous version)
set undofile           " keep an undo file (undo changes after closing)
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
"set foldenable
set exrc
set secure
set number
set noexpandtab
"set foldmethod=indent
set undodir=~/.config/nvim/undo//
setlocal path+=/home/gyok/program/build/cocos2d-x-3.14.1/cocos/

" Don't use Ex mode, use Q for formatting
noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

nmap <F8> :TagbarOpenAutoClose<CR>
nmap <F9> :NERDTreeToggle<CR>
nmap <F5> :GundoToggle<CR>

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

if &compatible
	  set nocompatible
endif
set runtimepath+=/home/gyok/.config/nvim/dein/repos/github.com/Shougo/dein.vim
call dein#begin('/home/gyok/.config/nvim/plugins')
call dein#add('Shougo/dein.vim')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('airblade/vim-gitgutter')
call dein#add('Shougo/deoplete.nvim')
call dein#add('tweekmonster/deoplete-clang2')
call dein#add('majutsushi/tagbar')
call dein#add('scrooloose/nerdtree')
call dein#add('kien/rainbow_parentheses.vim')
call dein#add('mhartington/oceanic-next')
call dein#add('sjl/gundo.vim')
call dein#add('tomtom/tcomment_vim')
call dein#end()
filetype plugin indent on
filetype plugin on

"+--Completion
	source ~/.config/nvim/completion.vim
"---Completion
let g:airline_theme='oceanicnext'
let g:airline_powerline_fonts = 1
	"+--Rainbow Parentheses"
	let g:rbpt_max = 16
	let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
	"---Rainbow Parentheses"

" Switch syntax highlighting on
syntax on
colorscheme OceanicNext

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
