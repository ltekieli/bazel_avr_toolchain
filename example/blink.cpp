#include <avr/interrupt.h>
#include <avr/io.h>

ISR (TIMER1_COMPA_vect)
{
    PORTB ^= (1 << PB0);
    PORTC ^= (1 << PC7);
    PORTD ^= (1 << PD5);
}

ISR (TIMER1_OVF_vect)
{
    // set timer initial value for 1 second delay with prescaler of 1024
    TCNT1 = 65535 - 15624;

    PORTB ^= (1 << PB0);
    PORTC ^= (1 << PC7);
    PORTD ^= (1 << PD5);
}

void init_timer_ctc()
{
    TCCR1A = 0;
    TCCR1B = 0;
    TCNT1 = 0;

    // 1 Hz (16000000/((15624+1)*1024))
    OCR1A = 15624;
    // CTC
    TCCR1B |= (1 << WGM12);
    // Prescaler 1024
    TCCR1B |= (1 << CS12) | (1 << CS10);
    // Output Compare Match A Interrupt Enable
    TIMSK1 |= (1 << OCIE1A);
}

void init_timer_normal()
{
    TCCR1A = 0;
    TCCR1B = 0;
    TCNT1 = 0;

    // set timer initial value for 1 second delay with prescaler of 1024
    TCNT1 = 65535 - 15624;
    // prescaler 1024
    TCCR1B |= (1 << CS12) | (1 << CS10);
    // enable overflow interrupt
    TIMSK1 |= (1 << TOIE1);
}

int main()
{
    // disable interrupts
    cli();

    // DDR == Data Direction Register
    DDRB  |= (1 << PB0);
    PORTB |= (0 << PB0);

    DDRC  |= (1 << PC7);
    PORTC |= (0 << PC7);

    DDRD  |= (1 << PD5);
    PORTD |= (0 << PD5);

    init_timer_ctc();
    //init_timer_normal();

    // enable interrupts
    sei();

    while (true)
    {
    }
}
