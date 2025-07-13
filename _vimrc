runtime plugged/plug.vim
" Load and init vim-plug.
call plug#begin('~/.vim/plugged')
    " Themes
    Plug 'mhartington/oceanic-next'
    Plug 'altercation/vim-colors-solarized'
    Plug 'lifepillar/vim-solarized8'
    Plug 'overcache/NeoSolarized'

    " Status lines
    Plug 'vim-airline/vim-airline'

    " Syntax highlights
    Plug 'sheerun/vim-polyglot'
    Plug 'rust-lang/rust.vim'

    " Editor features
    Plug 'junegunn/limelight.vim'
    Plug 'yggdroot/indentline', { 'on': 'IndentLinesToggle' }
    Plug 'machakann/vim-highlightedyank'
    Plug 'airblade/vim-gitgutter'

    " Productivity
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-projectionist'

    Plug 'jiangmiao/auto-pairs'
    Plug 'sbdchd/neoformat', { 'on': 'Neoformat' }
    Plug 'github/copilot.vim'
    Plug 'nvim-lua/plenary.nvim'

    " Tools that depend on external services
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
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
set colorcolumn=81,101

" Set max width to 80 characters
set tw=80

" Enable automatic text wrapping at text width
set fo-=l
set fo+=t

" Force all vertical splits to open to the right.
set splitright

" ------------- Theme ----------------
syntax enable

if ($COLORTERM =~ "^\\(truecolor\\|24bit\\)$")
    if (has("termguicolors"))
        if has("nvim")
            let $NVIM_TUI_ENABLE_TRUE_COLOR=1
        endif
        set termguicolors
    endif
endif

colorscheme OceanicNext
" colorscheme tokyonight
" let g:airline_theme = "OceanicNext"

" set background=dark
" if $ITERM_PROFILE =~ "Solarized Light"
"     set background=light
" endif
" colorscheme NeoSolarized

" ------------- Status Bar ----------------
"  Set encoding to UTF-8 (default on nvim)
set encoding=utf-8

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

" ------------- vim-jsx-pretty Settings ----------------
let g:vim_jsx_pretty_colorful_config=1

" ------------- ctrl-p Settings ----------------
let g:ctrlp_switch_buffer = 'E'
let g:ctrlp_tabpage_position = 'c'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_open_new_file = 't'
let g:ctrlp_match_window = 'max:40'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|^docs\|.tscache\|.venv'
let g:ctrlp_show_hidden = 1

" ------------- neoformat Settings ----------------
let g:neoformat_try_formatprg = 1
" Use <leader>f to format current buffer
map <leader>f <ESC>:Neoformat<CR>
imap <leader>f <ESC>:Neoformat<CR>

" ------------- indentLine Settings ----------------
let g:indentLine_enabled = 0
let g:indentLine_char = '│'

" ------------- Autopairs Settings ----------------
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutToggle = '<leader>]'
let g:AutoPairsShortcutJump = '<c-.>'
let g:AutoPairsShortcutFastWrap = '<c-9>'
let g:AutoPairsShortcutBackInsert = '<c-,>'

" ------------- Key mappings ----------------
" Useful mapping for iterative vimrc edits
map <leader>vimrc :tabe ~/.vimrc<cr>
autocmd bufwritepost .vimrc source $MYVIMRC

" Map <leader>r to run selected text/lines as a shell command
nmap <leader>r <ESC>:.w !zsh<CR>
vmap <leader>r <ESC>"cy<ESC>:execute '!'@c<CR>

" Map CTRL+e to open the in-editor file browser
map <C-e> <ESC>:Lexplore<CR>
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

" Github Copilot settings
imap <silent><script><expr> ‘ copilot#Next()
imap <silent><script><expr> “ copilot#Previous()
imap <silent><script><expr> « copilot#Dismiss()

" CodeCompanion settings
map <leader>cc <ESC>:CodeCompanionChat Toggle<CR>
