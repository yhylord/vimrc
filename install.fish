#!/usr/bin/env fish
if not test -e vim/bundle/Vundle.vim
        git clone https://github.com/gmarik/Vundle.vim.git vim/bundle/Vundle.vim
end
vim +BundleInstall +qa
if test -e ~/.vim
	mv ~/.vim{,.d.bak}
end
if test -e ~/.vimrc
	mv ~/.vimrc{,.bak}
end
cd
ln -s gitrepo/vimrc/vimrc .vimrc
ln -s gitrepo/vimrc/vim .vim
