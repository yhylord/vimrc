#!/bin/sh

git clone https://github.com/gmarik/Vundle.vim.git vim/bundle/vundle
vim +BundleInstall +qa
mv ~/.vim ~/.vim.d.bak
mv ~/.vimrc ~/.vimrc.bak
ln -s vim ~/.vim
ln -s vimrc ~/.vimrc
