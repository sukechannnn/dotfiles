" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup
set number
set incsearch
syntax enable
let loaded_matchparen = 1
colorscheme mine
set title
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set virtualedit=block
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set hidden
set tabstop=4
"set expandtab
set shiftwidth=4
set noautoindent
set nosmartindent

"=====================
"NeoBundle setting
"=====================
set nocompatible
filetype off            " for NeoBundle
 
if has('vim_starting')
	        set rtp+=$HOME/.vim/bundle/neobundle.vim/
	endif
	call neobundle#begin(expand('~/.vim/bundle'))
	NeoBundleFetch 'Shougo/neobundle.vim'
	 
	" ここから NeoBundle でプラグインを設定します
	  
	  " NeoBundle で管理するプラグインを追加します。
	  NeoBundle 'Shougo/neocomplcache.git'
	  NeoBundle 'Shougo/unite.vim.git'
	  NeoBundle 'scrooloose/nerdtree'
	  NeoBundle 'Shougo/neocomplcache'
      NeoBundle 'tomtom/tcomment_vim'
	  "      NeoBundle 'tpope/vim-endwise'



	  call neobundle#end()

	   filetype plugin indent on       " restore filetype

"=====================
"setting end
"=====================


"=====================
"key map
"=====================

nnoremap <silent><C-e> :NERDTreeToggle<CR>

"=====================

"=====================
"neocomplcache setting
"=====================
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化
"snippet ファイルの保存先
let g:neocomplcache_snippets_dir='~/.vim/snippets'
"dictionary
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'objc' : $HOME . '/.vim/dict/objc.dict'
    \ }
let g:neocomplcache_enable_underbar_completion = 1

inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"









