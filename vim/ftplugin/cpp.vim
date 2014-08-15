set et
set sw=2
set sts=2
set tw=78
set lbr
set cindent

call SingleCompile#SetCompilerTemplate('cpp', 'g++', 'GNU C++ Compiler', 
                                      \'g++', '-g -Wall -Wextra -o $(FILE_EXEC)$',
                                      \'$(FILE_RUN)$')
