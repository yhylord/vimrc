set et
set sw=2
set sts=2
set tw=78
set lbr
set autoindent

call SingleCompile#SetCompilerTemplate('pascal', 'fpc', 'Free Pascal Compiler', 
                        \'fpc', '-dDEBUG', '$(FILE_RUN)$')
