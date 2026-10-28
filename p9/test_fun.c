#include <stdio.h>

int suma(int, int);
int mystrcmp(char *, char *);
int mystrlen(char *);
int getBit(int, int);
int setBit(int, int);

int main()
{
    printf("suma(5,7) = %d\n", suma(5, 7));
    printf("mystrcmp(hola,hola) = %d\n", mystrcmp("hola", "hola"));
    printf("mystrcmp(hola,holo) = %d\n", mystrcmp("hola", "holo"));
    printf("mystrcmp(hola,hola!) = %d\n", mystrcmp("hola", "hola!"));
    printf("mystrlen(ensamblador) = %d\n", mystrlen("ensamblador"));
    printf("mystrlen(\"\") = %d\n", mystrlen(""));
    printf("getBit(5,0) = %d\n", getBit(5, 0));
    printf("getBit(5,1) = %d\n", getBit(5, 1));
    printf("getBit(5,2) = %d\n", getBit(5, 2));
    printf("setBit(0,2) = %d\n", setBit(0, 2));
    printf("setBit(8,0) = %d\n", setBit(8, 0));
    return 0;
}