#!/bin/sh

cp .gitconfig ~/
cp .npmrc ~/
cp .vimrc ~/
cp .zshrc ~/

# install .oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install Vundle
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install base16-shell
mkdir -p ~/.config/
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

