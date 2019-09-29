call plug#begin('~/.local/share/nvim/plugged')
" Auto-completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'davidhalter/jedi'
Plug 'zchee/deoplete-jedi'
" Utilities
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'vim-syntastic/syntastic'
Plug 'christoomey/vim-tmux-navigator'
" Document/markup languages
Plug 'lervag/vimtex'
Plug 'godlygeek/tabular' " Required for vim-markdown
Plug 'plasticboy/vim-markdown'
" Programming languages
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'rust-lang/rust.vim'
call plug#end()


""""""""""""""""""""""""
" VimTex configuration "
""""""""""""""""""""""""
let g:tex_flavor = "latex"
let g:Tex_DefaultTargetFormat = "pdf"
let g:vimtex_view_method = 'zathura'
let g:vimtex_latexmk_progname = 'nvr'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'nvim',
    \ 'build_dir' : './output',
    \}
set foldenable " Enable folding
set foldmethod=expr

""""""""""""""""""""""""""
" Deoplete configuration "
""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
    \ 'auto_complete_delay': 200,
    \ 'smart_case': v:true,
    \ })

""""""""""""""""""""""""""
" NerdTree configuration "
""""""""""""""""""""""""""
" autocmd vimenter * NERDTree " Auto open on start
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Auto close if NerdTree is the only window left open

map <C-n> :NERDTreeToggle<CR> " Nerdtree toggle


"""""""""""""""""""""""""""""""
" NerdCommenter configuration "
"""""""""""""""""""""""""""""""

let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left' " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_java = 1 " Set a language to use its alternate delimiters by default
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } } " Add your own custom formats or override the defaults
let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines = 1 " Enable NERDCommenterToggle to check all selected lines is commented or not 

"""""""""""""""""""""""""""""
"Vim-markdown configuration "
"""""""""""""""""""""""""""""
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_disabled = 1 " Folding disabled by default

""""""""""""""""""""""""
" Pymode configuration "
""""""""""""""""""""""""
let g:pymode_python = 'python3'
let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'

""""""""""""""""""""""
" Rust configuration "
""""""""""""""""""""""
let g:rustfmt_autosave = 1 " Auto format buffer on save

""""""""""""""""""""""""
" Tagbar configuration "
""""""""""""""""""""""""

