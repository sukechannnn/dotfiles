"=====================
" setting
"=====================
syntax enable

set encoding=utf-8
set modelines=3
set backspace=2
set number
set incsearch
set title
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set virtualedit=block
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set hidden
set expandtab
set tabstop=2
set shiftwidth=2
set noautoindent
set nosmartindent
set formatoptions=q
autocmd Filetype * set formatoptions-=c

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

hi Pmenu ctermbg=255 ctermfg=0 guifg=#000000 guibg=#999999
hi PmenuSel ctermbg=blue ctermfg=black
hi PmenuSbar ctermbg=0 ctermfg=9
hi PmenuSbar ctermbg=255 ctermfg=0 guifg=#000000 guibg=#FFFFFF

filetype plugin indent on
"=====================
"key map
"=====================

let NERDTreeShowHidden = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <silent><C-n> :NERDTreeTabsToggle<CR>
nnoremap <C-a> gt
nnoremap <C-w> <C-w>w
nnoremap <C-d> :vsplit<CR>

"=====================
"neocomplcache setting
"=====================
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"=====================
"cursor style
"=====================
let &t_SI = "\e]50;CursorShape=1\x7"
let &t_EI = "\e]50;CursorShape=0\x7"

"=====================
"vim-plug
"=====================
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimproc.vim', {'build': 'make'}
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Shougo/context_filetype.vim'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-endwise'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()

