" line of history to remember 
set history=500

"Enable syntax highlighting
syntax enable
syntax on

" Enable filetype plugins
filetype plugin on 
filetype indent on 

" Set to auto read when a file is changed from the outside
set autoread

" Set number display
set number
set relativenumber

"Fast search
set wildmenu
set wildignore=*.o,*~,*pyc,*/.git/*,*/.hg/*,*/.svn/*

" set 7 lines to the cursor when moving vertically
set so=7

"Show current position
set ruler

"Right backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"Right search
set ignorecase
set smartcase
set hlsearch
set incsearch

" enable magic for regex
set magic

" set more margin to the left
set foldcolumn=1

"Show matching brackets
set showmatch
set mat=2

"No sounds on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set t_Co=256
set t_ut=
set background=light

" Set utf8 as standard encoding
set encoding=utf8

"Set Unix as the standard file type
set ffs=unix,dos,mac

set nobackup
set nowb

" Use spaces instead of tabs
" set expandtab
" set smarttab
" set shiftwidth=4
" set tabstop=4

"Linebreak on 80 characters
" set lbr
" set tw=80

set ai "auto indent
set si "smart indent
set wrap "wrap lines

set laststatus=2
set noshowmode

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Share the VIM clipboard with the X11 clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard
 
  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

source ~/.config/nvim/plugins.vim
source ~/.config/nvim/keybindings.vim

" Remove some clipboard stuff to start VIM faster. See
" https://stackoverflow.com/questions/14635295/vim-takes-a-very-long-time-to-start-up
" set clipboard=exclude:.*
