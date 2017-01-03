"=====================
"dein
"=====================
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet')
call dein#add('scrooloose/nerdtree')
call dein#add('tomtom/tcomment_vim')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('Shougo/context_filetype.vim')

call dein#end()
"=====================
" setting
"=====================
syntax enable

set encoding=utf-8
set modelines=3
set backspace=2
set number
set incsearch
set term=xterm-256color
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
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"=====================
"rsense
"=====================
let g:rsenseHome = '/Users/obatayousuke/.anyenv/envs/rbenv/shims/rsense'
let g:rsenseUseOmniFunc = 1

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
