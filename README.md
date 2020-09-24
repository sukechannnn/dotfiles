# dotfile

## Usage

### Prepare

Install [anyenv](https://github.com/anyenv/anyenv) & install Ruby, Node.js, Python by anyenv

### Setup dotfiles

```
$ bash ./link_dotfiles.sh
```

### Atom (Nightly)

```
$ apm-nightly install --packages-file ./.atom/packages.txt
```

### VS Code

```
$ bash ./install_vscode_plugins.sh
```

### NeoVim

Install python by pyenv before execute below script.

```
$ brew install neovim
$ git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
$ pyenv virtualenv #{latest_version} neovim
$ pyenv global neovim3 && pip3 install pynvim
$ pyenv virtualenv system neovim2
$ pyenv global neovim2 && pip install pynvim
$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
$ sh ./installer.sh ~/.vim/dein
$ :call dein#install()
```

### Ruby Gems

```
$ bash ./install_pry.sh
```

