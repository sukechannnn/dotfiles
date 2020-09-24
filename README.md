# dotfile

## Usage

### Setup dotfiles

```
$ bash ./link_dotfiles.sh
```

### Vim

```
$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
$ sh ./installer.sh ~/.vim/dein
$ :call dein#install()
```

### Atom (Nightly)

```
$ cd ~/.atom
$ apm-nightly install --packages-file packages.txt
```

### Ruby Gems

```
$ bash ./install_pry.sh
```

