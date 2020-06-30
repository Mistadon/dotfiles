call plug#begin('~/.local/share/nvim/plugged')
" Auto-completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets
Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" Nerdtree
Plug 'scrooloose/nerdtree'
" Keeps nerdtree in sync between tabs
Plug 'jistr/vim-nerdtree-tabs'

" Nerdcommenter
Plug 'scrooloose/nerdcommenter'

" Linting
Plug 'w0rp/ale'

" Tagbar
Plug 'majutsushi/tagbar'

" Fuzzy file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Color schemes
Plug 'altercation/vim-colors-solarized'
Plug 'sickill/vim-monokai'
Plug 'sainnhe/forest-night'

" Airline statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Programing/markup languages
" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
" LaTeX
Plug 'lervag/vimtex'
" Python

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
			\ 'options' : [
			\ 	'-shell-escape',
        		\   	'-verbose',
        		\   	'-file-line-error',
        		\   	'-synctex=1',
        		\   	'-interaction=nonstopmode',
			\ ]
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

""""""""""""""""""""""""""""""
" Autocomplete configuration "
""""""""""""""""""""""""""""""
" copied from github repo
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
let g:airline#extensions#coc#enabled = 0
let airline#extensions#coc#error_symbol = 'Error:'
let airline#extensions#coc#warning_symbol = 'Warning:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"""""""
" ALE "
"""""""
" Auto-fix on save
let g:ale_fix_on_save = 1
" Use ale as completion source for all code

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

" Airline
let g:airline_powerline_fonts = 1

""""""""""""""""""""""
" Tags configuration "
""""""""""""""""""""""
map <C-b> :TagbarToggle<CR>
map <C-m> :Tags<CR>


