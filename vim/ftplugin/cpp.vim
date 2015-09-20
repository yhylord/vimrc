set et
set sw=4
set sts=4
set tw=78
set lbr
set cindent

call SingleCompile#SetCompilerTemplate('cpp', 'g++', 'GNU C++ Compiler', 
                                      \'g++', '-g -Wall -Wextra --std=c++11 -D yhylord -o $(FILE_EXEC)$',
                                      \'$(FILE_RUN)$')
