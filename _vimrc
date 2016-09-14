" Load and init pathogen.
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" ------------- Detect OS -------------
if has("win32")
    let g:current_os = "win"
else
    if system('uname')=~'Darwin'
        let g:current_os = "mac"
    else
        let g:current_os = "linux"
    endif
endif

" ------------- General ----------------
" Tab space : 4 Chars
set ts=4
set shiftwidth=4

" When using tabs, replace with spaces
set expandtab

" End of line: $; Tab: |---
set listchars=eol:$,tab:\|-

" Show line numbers
set number

" Smart indenting, autoindenting
set smartindent
set autoindent

" Disable wrapping
set nowrap

" If wrapping is enable, break lines at end of words
set linebreak

" Allow general yy/p to use system clipboard in mac osx (macvim only)
"set clipboard=unnamed

" ------------- Theme ----------------
" Set colorscheme
if !has('gui_running')
    " Compatibility for Terminal
    let g:solarized_termtrans=1

    " Make Solarized use 16 colors for Terminal support
    let g:solarized_termcolors=256

    "Set background
    set background=dark
endif
set t_Co=256
colo solarized

" ------------- Status Bar ----------------
" Always show status bar
set laststatus=2

" Show row,column on status bar
set ruler

" Enable wildcard menu
set wildmenu

" Enable visual bell. Gets rid of the annoying beep when the <ESC> key is hit.
set visualbell

"vim-airline settings
"let g:airline_theme = 'base16'

" ------------- Search ----------------
" Support incremental search.
set incsearch

" Always highlight all search result matches.
set hlsearch

" Support intelligent case sensitive search.
set ignorecase
set smartcase

" ------------- File Type Settings ----------------
" Enable file type plugins
filetype indent plugin on

" Enable syntax highlighting by default.
syntax on

" ------------- Backup File/Swap File Settings ----------------
set backupcopy=yes
set nowritebackup

" ------------- Ultisnips Settings ----------------
let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"  

" ------------- Ctrl-P Settings ----------------
let g:ctrlp_switch_buffer = 'E'
let g:ctrlp_tabpage_position = 'c'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_open_new_file = 't'
let g:ctrlp_match_window = 'max:40'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" ------------- vim-jsx Settings ----------------
let g:jsx_ext_required = 0

" ------------- Key mappings ----------------
" Map CTRL-E to open the in-editor file browser
map <C-E> :NERDTree<CR>
map <C-P> :CtrlP<CR>

" Switch tabs using CTRL-l or CTRL-h
map <C-l> gt
map <C-h> gT

" Allow CTRL+j or CTRL+k to move a line/selection up or down.
nmap <C-j> :m+<CR>
nmap <C-k> :m-2<CR>
vmap <C-j> :m'>+<CR>gv=gv
vmap <C-k> :m'<-2<CR>gv=gv

" Map <leader>s to search for word under cursor.
vmap <leader>s y/<C-R>"<CR>

" Use <leader>w to save all tabs
map <leader>w <ESC>:tabd w<CR>
imap <leader>w <ESC>:tabd w<CR>

" Use <leader>y and <leader>p to copy/paste to/from clipboard
if g:current_os == "mac"
    map <leader>y :w !pbcopy<CR><CR>
    vmap <leader>y :w !pbcopy<CR><CR>

    map <leader>p :r !pbpaste<CR>
    vmap <leader>p :r !pbpaste<CR>
else
    map <leader>y "<S-8>yy
    vmap <leader>y "<S-8>y

    map <leader>p "<S-8>p
    vmap <leader>p "<S-8>p
endif

" Line/selection up/down mappings for mac.
"if has("mac") || has("macunix")
"    nmap ∆ <M-j>
"    nmap ˚ <M-k>
"    vmap ∆ <M-j>
"    vmap ˚ <M-k>
"endif

