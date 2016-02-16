#!/bin/sh

cp .gitconfig ~/
cp .npmrc ~/
cp .vimrc ~/
cp .zshrc ~/
cp -r .oh-my-zsh ~/

# install Vundle
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
