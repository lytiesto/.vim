let mapleader = " "                                                                                                            
syntax on
set number
set norelativenumber
set cursorline
set wrap
set showcmd
set wildmenu

set hlsearch
exec "nohlsearch"
set incsearch

"set shiftwidth=4
""set softtabstop=4
au FileType html,vim,javascript setl shiftwidth=2
au FileType html,vim,javascript setl tabstop=2
au FileType java,php,go setl shiftwidth=4
au FileType java,php,go setl tabstop=4
au BufNewFile,BufRead *.py
      \ set tabstop=4 |
      \ set softtabstop=4 |
      \ set shiftwidth=4 |
      \ set textwidth=79 |
      \ set expandtab |
      \ set autoindent |
      \ set fileformat=unix |

"F2显示语法错误
autocmd FileType python map <buffer> <F2> :call Flake8()<CR>
""保存文件的时候显示错误
autocmd BufWritePost *.py call flake8#Flake8()
"在vim里运行Python
noremap <LEADER><CR> :nohlsearch<CR>
map <F5> :call RunPython()<CR>
func! RunPython()
  exec "W"
  if &filetype == 'python'
    exec "!time python3 %"
  endif
endfunc

map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>

imap <F6> <C-x><C-o>

map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR> 
map si :set nosplitbelow<CR>:split<CR> 
map sk :set splitbelow<CR>:split<CR> 

"跳行
noremap H 5h
noremap J 5j
noremap K 5k
noremap L 5L

call plug#begin('~/.vim/plugged')
                                        
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'nsf/gocode', { 'rtp': 'vim', 'do':'~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'nvie/vim-flake8'
"Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

Plug 'scrooloose/nerdtree'
"Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

call plug#end()

"colorscheme snazzy
colorscheme monokai 
"let g:SnazzyTransparent = 1 

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()

" ===
" " === NERDTree
" " ===
map tt :NERDTreeToggle<CR>
map <C-h> :tabp<CR>
map <C-l> :tabn<CR>
