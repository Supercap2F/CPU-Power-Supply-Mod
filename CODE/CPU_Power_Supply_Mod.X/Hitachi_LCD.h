/***********************************************
 * File:   Hitachi_LCD.h                       *
 * Author: Supercap2F                          *
 *                                             *
 * Created on October 24, 2015, 4:17 PM        *
 ***********************************************/
#ifndef HITACHI_LCD_H
#define	HITACHI_LCD_H

/***********************************************
 * Definitions                                 *
 ***********************************************/
#define SFTCLK LATBbits.LATB2
#define eLCD   LATBbits.LATB3
#define rsLCD  LATBbits.LATB4
#define rwLCD  LATBbits.LATB5

#define SDI LATAbits.LATA6
#define LCHCLK LATAbits.LATA7

/************************************************
 * function prototypes                          *
 ************************************************/
void LCDdata(unsigned char data);
void LCDwrchar(unsigned char letter);
void LCDwrstring(const unsigned char *string);
void LCDwrcmd(unsigned char value);
void LCDsetaddr(unsigned char add);

#endif	/* HITACHI_LCD_H */

