#include "delay.h"

#include <util/delay.h>

void delay_ms(int ms)
{
    while (0 < ms)
    {
        _delay_ms(1);
        --ms;
    }
}
