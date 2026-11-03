
#include <stdio.h>
#include <stdint.h>

extern void pBin8b(uint8_t dato);

/*extern void pBin16b(uint16_t dato);
extern void pBin32b(uint32_t dato);
extern void pBin64b(uint64_t dato);
*/
int main()
{
    printf("PRUEBAS P10\n\n");

    printf("Numero de 8 bits: ");
    pBin8b(25);
    printf("\n");

    printf("\nFin de las pruebas.\n");

    return 0;
}
