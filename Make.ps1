gcc -c -Wall -Werror -fpic .\kiwi.c
gcc -shared -o kiwi.dll .\kiwi.o -lSDL2
gfortran -o game kiwi.f90 game.f90 -L. -lkiwi