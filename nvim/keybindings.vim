let mapleader = ","
let maplocalleader = ","

" fast saving
nmap <leader>w :w!<cr>
" sudo save file
command W w !sudo tee % > /dev/null

" Visual mode pressing * or # searches for the current selection
" Idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"disable highlight 
map <silent> <leader><cr> :noh<cr>

"Nerdtree toggle
map <C-n> :NERDTreeToggle<CR>

" map space to search
map <space> /
map <c-space> ?

" Execute the current file
map <leader>e :!"%:p"

"moving between windows
"let g:tmux_navigator_no_mappings = 1
"let g:tmux_navigator_save_on_switch = 1

"nnoremap <silent> h :TmuxNavigateLeft<cr>
"nnoremap <silent> j :TmuxNavigateDown<cr>
"nnoremap <silent> k :TmuxNavigateUp<cr>
"nnoremap <silent> l :TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>


" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Vim easy align
" Keybindings from the readme:
" Start interactive EasyAlign in visual mode (e.g. vipga)
" xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap ga <Plug>(EasyAlign)
"
" My own keybindings:
" Auto-align the current table in LaTeX with vim-easy-align
nmap <localleader>la vie<Plug>(EasyAlign)*&