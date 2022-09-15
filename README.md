gcc -E main.c > main.i	--> preprocessing stage
gcc -S main.i 		--> generate assymply file
gcc -C main.s -o main.o --> generate object file
gcc -o output main.c    --> generate ouput file
