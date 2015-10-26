/***********************************************
 * File:   Hitachi_LCD.c                       *
 * Author: Supercap2F                          *
 *                                             *
 * Created on October 24, 2015, 4:17 PM        *
 ***********************************************/
#include "xc.h"
#include "Hitachi_LCD.h"
#include "CPU_Power_Supply_Mod.h"

/***********************************************
 * Functions                                   *
 ***********************************************/
void LCDdata(unsigned char data)
{
    int x;
    for(x=0;x<8;x++)
    {
        SDI=data & 0x1 ? 1:0;
        NOP();
        SFTCLK=1; 
        NOP();
        SFTCLK=0;
        data>>=1; 
    }
    NOP();
    LCHCLK=1;
    NOP();
    LCHCLK=0;
}

void LCDwrchar(unsigned char letter)
{
    rsLCD=1;            //
    rwLCD=0;            //
    LCDdata(letter);    // shift the letter onto the LCD data pins
    eLCD=1;             // clock data in
    _delay(2);      // delay for more than 230ns
    eLCD=0;             // finish clocking
    __delay_us(37);    // delay for 37us
}
void LCDwrstring(const unsigned char *string)
{
    while(*string) // write up to NULL
    {
        LCDwrchar(*string);
        string++;
    }
}
void LCDwrcmd(unsigned char value)
{
    rsLCD=0, rwLCD=0; //
    LCDdata(value);   // shift the value onto the LCD data pins
    eLCD=1;           // clock data in
    _delay(2);        // delay for more than 230ns
    eLCD=0;           // finish clocking
    __delay_us(37);   // delay for 37us
}
void LCDsetaddr(unsigned char add)
{
    rsLCD=0, rwLCD=0;        //
    LCDdata(add|0b10000000); // set address
    eLCD=1;                  // clock data in
    _delay(2);               // delay for more than 230ns
    eLCD=0;                  // finish clocking
    __delay_us(37);          // delay for 37us
}
