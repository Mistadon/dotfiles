call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips'
Plug 'lervag/vimtex'
Plug 'scrooloose/nerdtree'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'rust-lang/rust.vim'
Plug 'godlygeek/tabular'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'davidhalter/jedi'
Plug 'zchee/deoplete-jedi'
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

" UltiSnips configuration
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.dotfiles/ultisnips', $HOME.'/.local/share/nvim/plugged/vim-snippets/UltiSnips']
let g:UltiSnipsEditSplit="vertical"

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

"Vim-markdown configuration
let g:vim_markdown_toc_autofit = 1

" Pymode
let g:pymode_python = 'python3'
