
#include <stdio.h>
#include <stdint.h>

extern void pBin8b(uint8_t dato);
extern void pBin16b(uint16_t dato);
extern void pBin32b(uint32_t dato);
extern void pBin64b(uint64_t dato);

int main()
{
    printf("PRUEBAS P10\n\n");

    printf("Numero de 8 bits: ");
    fflush(stdout);
    pBin8b(25);
    printf("\n");

    printf("Numero de 16 bits: ");
    fflush(stdout);
    pBin16b(1000);
    printf("\n");

    printf("Numero de 32 bits: ");
    fflush(stdout);
    pBin32b(2147483647);
    printf("\n");
    printf("Numero de 64 bits: ");
    fflush(stdout);
    pBin64b(21474836480);
    printf("\n");

    printf("\nFin de las pruebas.\n");

    return 0;
}
