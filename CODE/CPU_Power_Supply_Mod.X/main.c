/*********************************************** 
 * File:   Main.c                              *
 * Author: Supercap2F                          *
 *                                             *
 * Created on October 9, 2015, 5:18 PM         *
 ***********************************************/
/***********************************************
 * Included files                              *
 ***********************************************/
#include <xc.h>

/***********************************************
 * Definitions                                 *
 ***********************************************/
#define _XTAL_FREQ 0x7A1200 // set system clock to 8MHz

#define SW1 PORTAbits.RA0 
#define SW2 PORTAbits.RA1
#define PN  LATAbits.LATA2 // power on
#define PG  PORTAbits.RA3 // power good 
#define SW3 PORTAbits.RA4
#define SDI LATAbits.LATA6
#define LCHCLK LATAbits.LATA7

#define RLn12V LATBbits.LATB0
#define RL12V  LATBbits.LATB1
#define SHFCLK LATBbits.LATB2
#define eLCD   LATBbits.LATB3
#define rsLCD  LATBbits.LATB4
#define rwLCD  LATBbits.LATB5
#define RL5V   LATBbits.LATB6
#define RL3V3  LATBbits.LATB7

/***********************************************
 * Device configuration                        *
 ***********************************************/
#pragma config OSC=INTIO2 // internal oscillator, port function on RA6 and RA7 
#pragma config FSCM=OFF   //
#pragma config IESO=OFF   //
#pragma config PWRT=ON    // power up timer enabled 
#pragma config BOR=OFF    // brown out reset off **MAY NEED TO BE CHANGED**
#pragma config WDT=OFF    // watch dog timer off
#pragma config MCLRE=ON    // MCLR pin is for reseting
#pragma config LVP=OFF    // low voltage programming is off
#pragma config STVR=ON    // stack overflow will cause a reset 


/***************************************************************
 * Program entry point - Main Function                         *
 ***************************************************************/
int main()
{
    /***********************************************
     * Oscillator Configuration                    *
     ***********************************************/
    OSCCONbits.IRCF0=1; // set main clock to 8MHz
    OSCCONbits.IRCF1=1;
    OSCCONbits.IRCF2=1;
    
    /***********************************************
     * I/O Setup                                   *
     ***********************************************
     * RA0 - SW1    | RA1 - SW2  | RA2 - PN    |   *
     * RA3 - PG     | RA4 - SW3  | RA6 - SDI   |   *
     * RA7 - LCHCLK | RB0 - -12V | RB1 - +12V  |   *
     * RB2 - SFTCLK | RB3 - eLCD | RB4 - rsLCD |   *
     * RB5 - rwLCD  | RB6 - +5V  | RB7 - +3.3V |   *
     *                                             *
     ***********************************************/
    TRISA=0b00010011;  // set I/O ports to either input (1) or output (0)
    LATA=0b00000000;   // clear outputs 
    ADCON1=0b11111111; // make all outputs/inputs digital 
    
    TRISB=0b00000000; //  set I/O ports to either input (1) or output (0)
    LATB=0b00000000;  // clear outputs
    
    /***********************************************
     * Main Code                                   *
     ***********************************************/
    while(1) {
        if(SW1==1) {
            __delay_ms(8); // delay for 8 mS to debounce 
            if(SW1==1){
                RL3V3=~RL3V3; 
                while(SW1==1); 
            }
        }    
        
        if(SW2==1) {
            __delay_ms(8); // delay for 8 mS to debounce 
            if(SW2==1){
                RL5V =~RL5V; 
                while(SW2==1);
            }
        } 
        
        if(SW3==1) {
            __delay_ms(8); // delay for 8 mS to debounce 
            if(SW3==1){
                RL12V =~RL12V; 
                while(SW3==1);
            }
        } 
    }
}

