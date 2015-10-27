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
#include "CPU_Power_Supply_Mod.h"
#include "Hitachi_LCD.h" // .h file with all display functions 
#include "Bitmaps.c"     // c file with all the CGRAM data in it
/***********************************************
 * Definitions                                 *
 ***********************************************/

/***********************************************
 * Device configuration                        *
 ***********************************************/
#pragma config OSC=INTIO2 // internal oscillator, port function on RA6 and RA7 
#pragma config FSCM=OFF   //
#pragma config IESO=OFF   //
#pragma config PWRT=ON    // power up timer enabled 
#pragma config BOR=OFF    // brown out reset off **MAY NEED TO BE CHANGED**
#pragma config WDT=OFF    // watch dog timer off
#pragma config MCLRE=ON   // MCLR pin is for reseting
#pragma config LVP=OFF    // low voltage programming is off
#pragma config STVR=ON    // stack overflow will cause a reset 

/***********************************************
 * Function Definitions                        *
 ***********************************************/
void DefaultMenu(void); 
void StandbyMenu(void);
void OptMenu(void);
void interrupt isr(void);

/***********************************************
 * Global Variables                            *
 ***********************************************/
int CharacterBlink=0;

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
    
    PN=1;
    RL12V=1;
    RLn12V=1;
    RL5V=1;
    RL3V3=1;
    
    /***********************************************
     * interrupt Setup                             *
     ***********************************************/
    RCONbits.IPEN=0;     //Turn off interrupt priority
    
    /***********************************************
     * Timer0 Setup                                *
     ***********************************************
     * Timer0 is for any blinking character on the *
     * screen. When it interrupts it sets the      *
     * variable "CharacterBlink" which should be   *
     * polled and cleared in software.             *
     ***********************************************/
    TMR0L=0;             // clear the timer0 count 
    TMR0H=0;             //
    T0CON=0b10010011;    // setup timer0 so that:
                         //      it is a 16 bit timer
                         //      it counts on clock cycles
                         //      it uses a prescaler set to 128 so the timer rolls over every 1.04s
    INTCONbits.TMR0IF=0; // clear the timer 0 flag bit
   
    /***********************************************
     * Main Code                                   *
     ***********************************************/
    //while(1) {
       LCDwrcmd(0b00111100); // 8 bit mode
       LCDwrcmd(0b00000110); // address counter will increment
       LCDwrcmd(0b00001100); // cursor off display on blink off
       LCDwrcmd(0b00000001); // clear display
       __delay_ms(2);
       
       //StandbyMenu();
       DefaultMenu();  
}


/***************************************************************
 * StandbyMenu Function                                        *
 ***************************************************************/
void StandbyMenu(void)
{
    LCDwrcmd(0b00000001); // clear display
    __delay_ms(2);
    LCDwrstring("    STANDBY    ");
    
    while(1) {
        if(SW1){
           __delay_ms(12);
           if(SW1)
           {
               PN=0;
               while(SW1);
               return;
           }
        }
        if(SW2){
           __delay_ms(12);
           if(SW2)
               {
               PN=0;
               while(SW2);
               return;
           }
        }if(SW3){
           __delay_ms(12);
           if(SW3)
                {
               PN=0;
               while(SW3);
               return;
           }
        }
    }
}



/***************************************************************
 * DefaultMenu Function                                        *
 ***************************************************************/
void DefaultMenu(void)
{
    /***********************************************
     * Variable Definitions                        *
     ***********************************************/
    int x,y;    // random variables  
    int last=0; // variable the keeps track of the last cursor state
    
    struct MenuDisplay {             // structure that holds general information
        unsigned char Addr[5];       // addresses of each place the cursor can be
        unsigned char CurrentSelect; // current place where the cursor is 
        unsigned char ONorOFF[5];    // variable that keeps track of each voltages on/off state
    };
    
    struct MenuDisplay MenuItem = {  // create the structure 
        0x04,0x09,0x0F,0x45,0x4C,    // fill up the Addr variable 
        0,                           // fill up the CurrentSelect variable 
        0,0,0,0,0                    // fill up the ONorOFF variable 
    };
    
    /***********************************************
     * Setup the LCD                               *
     ***********************************************/
    for(y=0;y<8;y++) // this loop loads the custom characters into the CGRAM
            for(x=0;x<7;x++)
            {
                LCDwrcmd((0b01000000|x)|(y<<3));
                LCDwrchar(Default_Menu_Bitmaps[y][x]);
            }
   LCDsetaddr(0); // set address to start - else it will still write to the CGRAM
   
   LCDwrstring("12V=/ 5V=/ 3V3=/"); // default menu screen (all outputs off)
   LCDsetaddr(0x40);                //
   LCDwrstring("-12V=/      MENU"); //
   
   /***********************************************
    * This loop scans the keyboard and the TMR0   *
    * flag, and updates the screen/relay states   *
    * accordingly                                 *
    ***********************************************/
   while(1) {
       if(SW3==1) {        // check to see if the move right key was pressed 
           __delay_ms(12); // debounce if it looks like it was pressed 
           if(SW3==1) {    // if it was pressed
               LCDsetaddr(MenuItem.Addr[MenuItem.CurrentSelect]); // set the cursor to the current address 
               if(MenuItem.CurrentSelect==4)                      // if the current address is the menu option
                   LCDwrstring("MENU");                           //    set it to "MENU" to make sure it's not highlighted
               else                                               //    when current selection is switched 
                   LCDwrchar(MenuItem.ONorOFF[MenuItem.CurrentSelect] ? 0x00:0x2F); // else 
                                                                  //    make sure either the power symbol or the '/' symbol
                                                                  //    aren't highlighted (according to if the voltage is
                                                                  //    on or off)
               
               MenuItem.CurrentSelect++;     // change where the cursor is 
               if(MenuItem.CurrentSelect==5) // if it equals five (i.e. if it's off the screen)
                   MenuItem.CurrentSelect=0; //     then move it to the first place on the screen 
               while(SW3==1);                // wait for the switch to be let off of before moving forward in the code 
           }
       }
       
       if(SW2==1) {        // check to see if the move left key was pressed 
           __delay_ms(12); // debounce if it looks like it was pressed 
           if(SW2==1) {    // if it was pressed 
               LCDsetaddr(MenuItem.Addr[MenuItem.CurrentSelect]); // set the cursor to the current address 
               if(MenuItem.CurrentSelect==4)                      // if the current address is the menu option
                   LCDwrstring("MENU");                           //    set it to "MENU" to make sure it's not highlighted 
               else                                               //    when current selection is switched 
                   LCDwrchar(MenuItem.ONorOFF[MenuItem.CurrentSelect] ? 0x00:0x2F); // else 
                                                                  //    make sure either the power symbol or the '/' symbol
                                                                  //    aren't highlighted (according to if the voltage is
                                                                  //    on or off)
               
               if(MenuItem.CurrentSelect==0) // if the current selection is zero 
                   MenuItem.CurrentSelect=5; //     set it to 5 so a negative number is not created 
               MenuItem.CurrentSelect--;     // change where the cursor is 
               while(SW2==1);                // wait for the switch to be let off of before moving forward in the code 
           }
       }
       
       if(SW1==1) {        // check to see if the select key was pressed
           __delay_ms(12); // debounce if it looks like it was pressed
           if(SW1==1) {    // if it was pressed 
               if(MenuItem.CurrentSelect==4) { // if the current selection is "MENU"
                   OptMenu();                  // put menu function here    
                   LCDsetaddr(0); // set address to start - else it will still write to the CGRAM
                   LCDwrstring("12V=/ 5V=/ 3V3=/"); // default menu screen (all outputs off)
                   LCDsetaddr(0x40);                //
                   LCDwrstring("-12V=/      MENU"); //
               }
               else {                                                               // else 
                   MenuItem.ONorOFF[MenuItem.CurrentSelect]=~MenuItem.ONorOFF[MenuItem.CurrentSelect]; // invert the current state
                                                                                    // of the selected voltage 
                   LCDsetaddr(MenuItem.Addr[MenuItem.CurrentSelect]);               // set the cursor to the current selection                  
                   LCDwrchar(MenuItem.ONorOFF[MenuItem.CurrentSelect] ? 0x00:0x2F); // depending on what state the selections is
                                                                                    // being changed to, put up the correct symbol
                   switch(MenuItem.CurrentSelect) {                                 // this switch turns on/off the appropriate 
                       case 0:                                                      // relay based upon the selection 
                           RL12V=~MenuItem.ONorOFF[MenuItem.CurrentSelect];         //
                           break;                                                   //
                       case 1:                                                      //
                           RL5V=~MenuItem.ONorOFF[MenuItem.CurrentSelect];          //
                           break;                                                   //
                       case 2:                                                      //
                           RL3V3=~MenuItem.ONorOFF[MenuItem.CurrentSelect];         //
                           break;                                                   //
                       case 3:                                                      //
                           RLn12V=~MenuItem.ONorOFF[MenuItem.CurrentSelect];        //
                           break;                                                   //
                   }
               }
               while(SW1==1); // wait for the switch to be let off of before moving forward in the code 
           }
       }
       
       if(INTCONbits.TMR0IF) {           // if the TMR0 flag is set (i.e. the cursor needs to change state)
           LCDsetaddr(MenuItem.Addr[MenuItem.CurrentSelect]); // set the cursor to the current address
           if(MenuItem.CurrentSelect==4)                      // if it's on "MENU"
               if(last)                                       //    invert it based upon it's last state 
                   LCDwrstring("MENU");                       //
               else {                                         //
                   LCDwrchar(0x02);                           //
                   LCDwrchar(0x03);                           //
                   LCDwrchar(0x04);                           //
                   LCDwrchar(0x05);                           //
               }
           else                                               // if it's on anything besides "MENU"
               if(MenuItem.ONorOFF[MenuItem.CurrentSelect])   //    invert it based upon it's last state 
                   LCDwrchar(last ? 0:1);                     //
               else                                           //
                   LCDwrchar(last ? 0x2F:0x06);               //
      
           last=last ? 0:1;     // invert the last variable so the last cursor state can be kept track of 
           INTCONbits.TMR0IF=0; // reset the TMR0 flag    
       } 
   }
   while(1);
}

/***************************************************************
 * OptMenu Function                                            *
 ***************************************************************/
void OptMenu(void)
{
    /***********************************************
     * Variable Definitions                        *
     ***********************************************/
    int x,y; 
    int update=1;
    
    struct MenuDisplay {
        unsigned char CurrentItem;
        unsigned char Items[5][16];
        
    };
    struct MenuDisplay Menu ={
        0,
        "Standby",
        "Pair",
        "Pair All",
        "Pair None",
        "Back"
    };
    
    
    LCDwrcmd(0b00000001); // clear display
    __delay_ms(2);
    
    while(1)
    {
        if(update){
            LCDsetaddr(0x00);
            LCDwrchar(Menu.CurrentItem+1+0x30);
            LCDwrstring(": ");
            LCDwrstring(Menu.Items[Menu.CurrentItem]);
            LCDwrstring("             ");
            LCDsetaddr(0x0F);
            LCDwrchar(0x7F);

            LCDsetaddr(0x40);
            if(Menu.CurrentItem<4) {
                LCDwrchar(Menu.CurrentItem+2+0x30);
                LCDwrstring(": ");
                LCDwrstring(Menu.Items[Menu.CurrentItem+1]);
                LCDwrstring("             ");
            }
            else
                LCDwrstring("                ");
            update=0;
        }
        if(SW3){
            __delay_ms(12);
            if(SW3) {
                if(Menu.CurrentItem==4)
                    Menu.CurrentItem=0;
                else
                    Menu.CurrentItem++;
                update=1;
                while(SW3);
            }
        }
        if(SW2){
            __delay_ms(12);
            if(SW2) {
                if(Menu.CurrentItem==0)
                    Menu.CurrentItem=4;
                else
                    Menu.CurrentItem--;
                update=1;
                while(SW2);
            }
        }
        if(SW1){
            __delay_ms(12);
            if(SW1) {
                switch(Menu.CurrentItem){
                    case 4:
                        while(SW1);
                        return;
                        break;
                }
                while(SW1);
            }
        }
       
    
    }
}


