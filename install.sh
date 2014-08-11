#!/bin/sh

if [ ! -e vim/bundle/Vundle.vim ]; then
        git clone https://github.com/gmarik/Vundle.vim.git vim/bundle/Vundle.vim
fi
vim +BundleInstall +qa
if [ -e ~/.vim ]; then
	mv ~/.vim ~/.vim.d.bak
fi
if [ -e ~/.vimrc ]; then
	mv ~/.vimrc ~/.vimrc.bak
fi
cd
ln -s gitrepo/vimrc/vimrc .vimrc
ln -s gitrepo/vimrc/vim .vim
