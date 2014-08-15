set tw=0
set wrap
set ts=2
set sw=2
set et

let g:Tex_Flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='xelatex -interaction=nonstopmode -shell-escape %'

call SingleCompile#SetPriority('tex', 'xelatex', 1)
call SingleCompile#SetCompilerTemplate('tex', 'xelatex', 'XeLaTeX',
                                      \'xelatex', '-interaction=nonstopmode %', '')
