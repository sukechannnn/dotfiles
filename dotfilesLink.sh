#! /bin/bash
ln -fnsv ~/dotfiles/.zprofile ~/.zprofile
ln -fnsv ~/dotfiles/.zshenv ~/.zshenv
ln -fnsv ~/dotfiles/.zshrc ~/.zshrc
ln -fnsv ~/dotfiles/.zpreztorc ~/.zpreztorc
ln -fnsv ~/dotfiles/.vimrc ~/.vimrc
ln -fnsv ~/dotfiles/.atom ~/.atom
ln -fnsv ~/dotfiles/nvim ~/.config
if [ ! -d ~/.bundle ]; then
  mkdir ~/.bundle
fi
ln -fnsv ~/dotfiles/.bundle/config ~/.bundle/config
ln -fnsv ~/dotfiles/.gemrc ~/.gemrc
ln -fnsv ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -fnsv ~/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
