#!/bin/sh

if [ ! -e vim/bundle/Vundle.vim ]; then
        git clone https://github.com/gmarik/Vundle.vim.git vim/bundle/Vundle.vim
fi
vim +BundleInstall +qa
if [ -e ~/.vim ]; then
	mv ~/.vim{,.d.bak}
fi
if [ -e ~/.vimrc ]; then
	mv ~/.vimrc{,.bak}
fi
path=$(pwd)
cd
ln -s $path/vimrc .vimrc
ln -s $path/vim .vim
