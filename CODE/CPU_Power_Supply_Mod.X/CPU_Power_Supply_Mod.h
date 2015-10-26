/***********************************************
 * File:   CPU_Power_Supply_Mod.h              *
 * Author: Supercap2F                          *
 *                                             *
 * Created on October 24, 2015, 4:24 PM        *
 ***********************************************/
#ifndef CPU_POWER_SUPPLY_MOD_H
#define	CPU_POWER_SUPPLY_MOD_H

/***********************************************
 * Definitions                                 *
 ***********************************************/
#define _XTAL_FREQ 0x7A1200 // set system clock to 8MHz

#define SW1 PORTAbits.RA0 
#define SW2 PORTAbits.RA1
#define PN  LATAbits.LATA2 // power on
#define PG  PORTAbits.RA3 // power good 
#define SW3 PORTAbits.RA4

#define RLn12V LATBbits.LATB0
#define RL12V  LATBbits.LATB1
#define RL5V   LATBbits.LATB7
#define RL3V3  LATBbits.LATB6

#endif	/* CPU_POWER_SUPPLY_MOD_H */

