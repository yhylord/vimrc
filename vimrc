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
if has('unix')
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
else
	set rtp+=$VIM\vimfiles\bundle\Vundle.vim
	call vundle#begin($VIM\vimfiles\bundle)
endif

" using vundle manage vundle
Bundle 'gmarik/Vundle.vim'

" original repos on github
Bundle 'itchyny/lightline.vim'
Bundle 'mbbill/fencview'
Bundle 'altercation/vim-colors-solarized'
Bundle 'jcf/vim-latex'

" vim-scripts repos
Bundle 'SingleCompile'

call vundle#end()
filetype plugin indent on

" basic
set backspace=indent,eol,start
set whichwrap=h,l

" edit
set smarttab
set autowrite
set display=lastline

" Misc
set mouse=a
set wildmenu
set showcmd
set incsearch

" Encoding
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
if has('unix')
	set langmenu=en_US.UTF-8
	language message en_US.UTF-8
else
	set langmenu=zh_CN.GB18030
	language message zh_CN.GB18030
endif

" Display
set number
set fo+=mB
set background=dark
if has("gui_running")
	set guioptions+=b
	colo solarized
else
	colo torte
endif

if has('unix')
	set guifont=Droid\ Sans\ Mono\ Medium\ 11
else
	set guifont=Lucida_Console: h11: cANSI
	set guifontwide=NSimSun: h11: cGB2312
endif

" SingleCompile

" Lang Templates

call SingleCompile#SetCompilerTemplate('pascal', 'fpc', 'Free Pascal Compiler', 
                        \'fpc', '-dDEBUG', '$(FILE_RUN)$')

call SingleCompile#SetCompilerTemplate('cpp', 'g++', 'GNU C++ Compiler', 
                        \'g++', '-g -Wall -Wextra -o $(FILE_EXEC)$', '$(FILE_RUN)$')
call SingleCompile#SetCompilerTemplate('tex', 'xelatex', 'XeLaTeX',
			\'xelatex', '-interaction=nonstopmode %', '')
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
let g:Tex_Flavor = 'xelatex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode %'

" shell for unix
if has("unix")
	set shell=/bin/bash
endif
