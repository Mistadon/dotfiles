call plug#begin('~/.local/share/nvim/plugged')
" Auto-completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'davidhalter/jedi'
Plug 'zchee/deoplete-jedi'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Nerdtree
Plug 'scrooloose/nerdtree'
" Keeps nerdtree in sync between tabs
Plug 'jistr/vim-nerdtree-tabs'

" Nerdcommenter
Plug 'scrooloose/nerdcommenter'

" Linting
Plug 'w0rp/ale'

" Fuzzy file finder
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Tags
Plug 'majutsushi/tagbar'

" Github integration
Plug 'tpope/vim-fugitive'

" Latex
Plug 'lervag/vimtex'

" Markdown
Plug 'godlygeek/tabular' " Required for vim-markdown
Plug 'plasticboy/vim-markdown'

" 
Plug 'vim-syntastic/syntastic'

" Python
Plug 'python-mode/python-mode', { 'branch': 'develop' }

" Rust
Plug 'rust-lang/rust.vim'
call plug#end()


""""""""""""""""""""""""
" VimTex configuration "
""""""""""""""""""""""""
let g:tex_flavor = "latex"
let g:Tex_DefaultTargetFormat = "pdf"
" let g:vimtex_compiler_latexmk_engines = { '_' : '-lualatex',}
let g:vimtex_view_method = 'zathura'
let g:vimtex_latexmk_progname = 'nvr'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_latexmk = {
			\ 'backend' : 'nvim',
			\ 'build_dir' : './output',
			\ 'continuous' : 0,
			\}
let g:vimtex_fold_types = {
			\ 'sections' : { 'sections' : [] },
			\ 'envs' : {
			\ 'whitelist' : ['figure', 'table', 'gel']
			\},
			\}
" Enable folding
let g:vimtex_fold_enabled = 1
set foldenable
set foldmethod=manual
set fillchars=fold:\ 

""""""""""""""""""""""""""
" Deoplete configuration "
""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
    \ 'auto_complete_delay': 200,
    \ 'smart_case': v:true,
    \ })


""""""""""""""""""""""""
" Tagbar configuration "
""""""""""""""""""""""""
map <C-m> :TagbarToggle<CR>

"""""""
" ALE "
"""""""
" Auto-fix on save
let g:ale_fix_on_save = 1
" Use ale as completion source for all code
call deoplete#custom#option('sources', {
\ '_': ['ale'],
\})

""""""""""""""""""""""""""
" NerdTree configuration "
""""""""""""""""""""""""""
" autocmd vimenter * NERDTree " Auto open on start
" Auto close if NerdTree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"
" Nerdtree toggle
map <C-n> :NERDTreeToggle<CR>


"""""""""""""""""""""""""""""""
" NerdCommenter configuration "
"""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""
"Vim-markdown configuration "
"""""""""""""""""""""""""""""
let g:vim_markdown_toc_autofit = 1
" Folding disabled by default
let g:vim_markdown_folding_disabled = 1

""""""""""""""""""""""""
" Pymode configuration "
""""""""""""""""""""""""
let g:pymode_python = 'python3'
let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'

""""""""""""""""""""""
" Rust configuration "
""""""""""""""""""""""
" Auto format buffer on save
let g:rustfmt_autosave = 1

"""""""""""""""""""""""""""
" Ultisnips configuration "
"""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="context"
