# dotfile

## Usage

### Setup dotfiles

```
$ bash ./link_dotfiles.sh
```

### Atom (Nightly)

```
$ cd ~/.atom
$ apm-nightly install --packages-file packages.txt
```

### VS Code

```
$ bash ./install_vscode_plugins.sh
```

### Vim

```
$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
$ sh ./installer.sh ~/.vim/dein
$ :call dein#install()
```

### Ruby Gems

```
$ bash ./install_pry.sh
```

