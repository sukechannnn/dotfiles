let [plugins, ftplugin] = dein#load_cache_raw(['/Users/obatayousuke/.vimrc'], 1)
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/obatayousuke/.vim/dein'
let g:dein#_runtime_path = '/Users/obatayousuke/.vim/dein/.dein'
let &runtimepath = '/Users/obatayousuke/.vim/dein/.dein,/Users/obatayousuke/.vim/dein/repos/github.com/Shougo/dein.vim/,/Users/obatayousuke/.vim,/usr/local/share/vim/vimfiles,/usr/local/share/vim/vim80,/usr/local/share/vim/vimfiles/after,/Users/obatayousuke/.vim/after,/Users/obatayousuke/.vim/dein/.dein/after'
