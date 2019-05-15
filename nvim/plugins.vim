call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'lervag/vimtex'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'davidhalter/jedi'
Plug 'zchee/deoplete-jedi'
Plug 'w0rp/ale'
Plug 'junegunn/vim-easy-align'
call plug#end()


" VimTex configuration
let g:tex_flavor = "latex"
let g:Tex_DefaultTargetFormat = "pdf"
let g:vimtex_view_method = 'zathura'
let g:vimtex_latexmk_progname = 'nvr'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'nvim',
    \ 'build_dir' : './output',
    \}
set foldenable
set foldmethod=expr

" Deoplete configuration
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
    \ 'auto_complete_delay': 200,
    \ 'smart_case': v:true,
    \ })


" NerdTree configuration
" Auto open on start
" autocmd vimenter * NERDTree

" Auto close if NerdTree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NerdCommenter configuration
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"Vim-markdown configuration
let g:vim_markdown_toc_autofit = 1

" Pymode
let g:pymode_python = 'python3'
let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'
