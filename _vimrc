runtime plugged/plug.vim
" Load and init vim-plug.
call plug#begin('~/.vim/plugged')

    " Themes
    Plug 'mhartington/oceanic-next'
    " Plug 'adrian5/oceanic-next-vim'
    Plug 'glepnir/oceanic-material'
    Plug 'ghifarit53/tokyonight-vim'
    " Plug 'folke/tokyonight.nvim'

    " Status lines
    Plug 'vim-airline/vim-airline'
    " Plug 'hoob3rt/lualine.nvim'

    Plug 'altercation/vim-colors-solarized'
    Plug 'lifepillar/vim-solarized8'
    Plug 'overcache/NeoSolarized'

    " Syntax highlights
    Plug 'sheerun/vim-polyglot'
    Plug 'racer-rust/vim-racer'

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

    " Plug 'ervandew/supertab'
    " Plug 'sbdchd/neoformat', { 'on': 'Neoformat' }
    " Plug 'scrooloose/syntastic'

    " Tools that depend on external services
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

" ------------- ultisnips Settings ----------------
let g:UltiSnipsExpandTrigger="<c-f>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-d>"

" ------------- vim-jsx-pretty Settings ----------------
let g:vim_jsx_pretty_colorful_config=1

" ------------- ctrl-p Settings ----------------
let g:ctrlp_switch_buffer = 'E'
let g:ctrlp_tabpage_position = 'c'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_open_new_file = 't'
let g:ctrlp_match_window = 'max:40'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|docs\|.tscache'
let g:ctrlp_show_hidden = 1

" ------------- neoformat Settings ----------------
" let g:neoformat_try_formatprg = 1
" Use <leader>f to format current buffer
" map <leader>f <ESC>:Neoformat<CR>
" imap <leader>f <ESC>:Neoformat<CR>

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

" ------------- coc.nvim Settings ----------------
" " Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" " unicode characters in the file autoload/float.vim
" set encoding=utf-8

" " TextEdit might fail if hidden is not set.
" set hidden

" " Some servers have issues with backup files, see #649.
" set nobackup
" set nowritebackup

" " Give more space for displaying messages.
" set cmdheight=2

" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
" set updatetime=300

" " Don't pass messages to |ins-completion-menu|.
" set shortmess+=c

" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
" if has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif

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

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
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
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
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

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" ------------- Key mappings ----------------
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

" Key mapping for rust auto completion and type definitions
augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gf  <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs  <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> gd  <Plug>(rust-doc)
augroup END
