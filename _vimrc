runtime plugged/plug.vim
" Load and init vim-plug.
call plug#begin('~/.vim/plugged')

    Plug 'mhartington/oceanic-next'
    Plug 'othree/yajs.vim'
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'othree/html5.vim'
    Plug 'mxw/vim-jsx'
    Plug 'machakann/vim-highlightedyank'

    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'ervandew/supertab'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-projectionist'
    Plug 'SirVer/ultisnips'

    Plug 'airblade/vim-gitgutter'
    Plug 'sbdchd/neoformat', { 'on': 'Neoformat' }
    Plug 'scrooloose/syntastic'

    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'yggdroot/indentline', { 'on': 'IndentLinesToggle' }

    Plug 'digitaltoad/vim-pug'

call plug#end()

" ------------- Detect OS -------------
if has("win32")
    let g:current_os = "win"
else
    if system('uname') =~ 'Darwin'
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

" Show a column marker at the 81st column.
set colorcolumn=81

" ------------- Theme ----------------
syntax enable

if ($COLORTERM =~ "^\\(truecolor\\|24bit\\)$")
    if (has("termguicolors"))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
        set termguicolors
    endif
endif

colorscheme OceanicNext

" set background=dark
" if $ITERM_PROFILE =~ "Solarized Light"
"     set background=light
" endif
" colorscheme NeoSolarized

" ------------- Status Bar ----------------
" Always show status bar
set laststatus=2

" Show row,column on status bar
set ruler

" Enable wildcard menu
set wildmenu

" Enable visual bell. Gets rid of the annoying beep when the <ESC> key is hit.
set visualbell

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

" ------------- Backup File/Swap File Settings ----------------
set backupcopy=yes
set nowritebackup

" ------------- NeoVim inccommand settings ----------------
if exists('&inccommand')
  set inccommand=nosplit
endif

" ------------- vim-javascript Settings ----------------
let g:javascript_plugin_jsdoc=1 "Required for jsdoc syntax highlighting

" ------------- ultisnips Settings ----------------
let g:UltiSnipsExpandTrigger="<c-f>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-d>"

" ------------- ctrl-p Settings ----------------
let g:ctrlp_switch_buffer = 'E'
let g:ctrlp_tabpage_position = 'c'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_open_new_file = 't'
let g:ctrlp_match_window = 'max:40'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|docs\|.tscache'
let g:ctrlp_show_hidden = 1

" ------------- vim-jsx Settings ----------------
let g:jsx_ext_required = 0

" ------------- neoformat Settings ----------------
let g:neoformat_try_formatprg = 1

" ------------- syntastic Settings ----------------
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'

let g:syntastic_typescript_checkers = ['tslint']

" For more ignore options, see:
"  - https://github.com/vim-syntastic/syntastic/wiki/HTML:---tidy#checker-options
"  -http://stackoverflow.com/questions/32669248/disable-syntasic-html-tidy-checker-for-a-file
let g:syntastic_html_tidy_ignore_errors=['<link> proprietary attribute "sizes"']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ------------- indentLine Settings ----------------
let g:indentLine_enabled = 0
let g:indentLine_char = '│'

" ------------- supertab Settings ----------------
let g:SuperTabDefaultCompletionType = "<c-p>"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" ------------- Key mappings ----------------
" Map CTRL+e to open the in-editor file browser
map <C-e> <ESC>:NERDTree<CR>
map <C-p> <ESC>:CtrlP<CR>

" Switch tabs using CTRL-l or CTRL-h
map <C-l> gt
map <C-h> gT

" Allow CTRL+j or CTRL+k to move a line/selection up or down.
nmap <C-j> :m+<CR>
nmap <C-k> :m-2<CR>
vmap <C-j> :m'>+<CR>gv=gv
vmap <C-k> :m'<-2<CR>gv=gv

" Map CTRL+n to jump to next item in list (used to nav through syntax errors)
map <C-n> <ESC>:lnext<CR>

" Map <leader>s to search for word under cursor.
vmap <leader>s y/<C-R>"<CR>

" Use <leader>w to save all tabs
map <leader>w <ESC>:tabd w<CR>
imap <leader>w <ESC>:tabd w<CR>

" Use <leader>f to format current buffer
map <leader>f <ESC>:Neoformat<CR>
imap <leader>f <ESC>:Neoformat<CR>

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
