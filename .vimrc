" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime " you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe " "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" vundle
set nocp
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" using vundle manage vundle
Bundle 'gmarik/vundle'

" original repos on github
Bundle 'itchyny/lightline.vim'
Bundle 'mbbill/fencview'
Bundle 'altercation/vim-colors-solarized'
Bundle 'jcf/vim-latex'

" vim-scripts repos
Bundle 'SingleCompile'

filetype plugin indent on

" basic
set backspace=indent,eol,start
set whichwrap=h,l

" edit
set smarttab
set autoindent
set autowrite
set display=lastline

" Misc
set mouse=a
set wildmenu
set showcmd
set incsearch

" Encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set langmenu=en_US.UTF-8
language message en_US.UTF-8

" Display
set number
set tw=79
set fo+=mB
set lbr
set background=dark
if has("gui_running")
	set guioptions+=b
	colo solarized
else
	colo torte
endif

set guifont=Droid\ Sans\ Mono\ Medium\ 11

" Filetype
autocmd BufNewFile,BufRead *.pas set et sts=2 sw=2 

" SingleCompile

" Lang Templates

call SingleCompile#SetCompilerTemplate('pascal', 'fpc', 'Free Pascal Compiler', 
                        \'fpc', '-gl -Crtoi', '$(FILE_RUN)$')

call SingleCompile#SetCompilerTemplate('cpp', 'g++', 'GNU C++ Compiler', 
                        \'g++', '-g -Wall -o $(FILE_EXEC)$', '$(FILE_RUN)$')
" map
nmap <F9> :SCCompile <CR>
nmap <C-F9> :SCCompileRun <CR>
nmap <M-F5> :SCViewResult <CR>

" feature
let g:SingleCompile_usequickfix=1

" lightline
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'component': {
      \   'readonly': '%{&readonly?"x":""}',
      \ }
      \ }
set laststatus=2
set noshowmode

" vim-latex
let g:Tex_CompileRule_dvi='xelatex -interaction=nonstop mode $'
