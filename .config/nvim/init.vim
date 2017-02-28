" An example for a vimrc file.
"
" To use it, copy it to
"     for Unix:     $HOME/.config/nvim/init.vim
"     for Windows:  %LOCALAPPDATA%\nvim\init.vim

set backup             " keep a backup file (restore to previous version)
set undofile           " keep an undo file (undo changes after closing)
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set smartindent
set expandtab
set foldenable
set exrc
set secure
set number
set noexpandtab

" Don't use Ex mode, use Q for formatting
noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

nmap <F8> :TagbarOpenAutoClose<CR>
nmap <F9> :NERDTreeToggle<CR>

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
call dein#add('airblade/vim-gitgutter')
call dein#add('Shougo/deoplete.nvim')
call dein#add('majutsushi/tagbar')
call dein#add('scrooloose/nerdtree')
call dein#add('kien/rainbow_parentheses.vim')
call dein#end()
filetype plugin indent on

let g:deoplete#enable_at_startup = 1

" Switch syntax highlighting on
syntax on

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
