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

#define COME_FROM_DEFAULT 0
#define COME_FROM_PAIR 1
#define CALL_PAIR_MENU 2
#define RETURN_TO_DEFAULT 3


/***********************************************
 * Function Definitions                        *
 ***********************************************/
void DefaultMenu(void); 
void StandbyMenu(void);
unsigned char OptMenu(unsigned char z);
void PairMenu();


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
     * screen. The TMR0IF flag is set when ever    *
     * the display should blink.                   *
     ***********************************************/
    TMR0L=0;             // clear the timer0 count 
    TMR0H=0;             //
    T0CON=0b10010011;    // setup timer0 so that:
                         //      it is a 16 bit timer
                         //      it counts on clock cycles
                         //      it uses a pre-scaler set to 128 so the timer rolls over every 1.04s
    INTCONbits.TMR0IF=0; // clear the timer 0 flag bit
   
    /***********************************************
     * Main Code                                   *
     ***********************************************/
       LCDwrcmd(0b00111100); // 8 bit mode
       LCDwrcmd(0b00000110); // address counter will increment
       LCDwrcmd(0b00001100); // cursor off display on blink off
       LCDwrcmd(0b00000001); // clear display
       __delay_ms(2);
       
       StandbyMenu();     // first call the standby function so the power supply will turn on in standby mode
       while(1)           // repeatedly call default menu
           DefaultMenu(); // 
       
}

/***************************************************************
 * StandbyMenu Function - This function is called when ever    *
 * the power supply needs to go into standby mode.             *
 ***************************************************************/
void StandbyMenu(void)
{
    PN=1;                           // set the power supply to standby mode
    LCDwrcmd(0b00000001);           // clear the display
    __delay_ms(2);                  // delay for 2mS to wait for last command to register
    LCDwrstring("    STANDBY    "); // write standby to the screen
    while(1) {                      // loop (almost) forever
        if(SW1 || SW2 || SW3){      // check if any switches where pressed
           __delay_ms(12);          // debounce
               while(SW1 || SW2 || SW3); // wait for switches to be let off of 
               PN=0;                // turn on power supply
               return;              // return to where the function was called from
           }
        }
}

/***************************************************************
 * DefaultMenu Function - In this function you can turn off/on *
 * individual voltages.                                        *
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
        unsigned char Pair;
    };
    
    struct MenuDisplay MenuItem = {  // create the structure 
        0x04,0x09,0x0F,0x45,0x4C,    // fill up the Addr variable 
        0,                           // fill up the CurrentSelect variable 
        0,0,0,0,0,                    // fill up the ONorOFF variable 
        0b00000101
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
                   while(SW1);                 // then wait for the switch to be let off of
                   RL12V=1;                    // turn off all relays
                   RLn12V=1;                   //
                   RL5V=1;                     //
                   RL3V3=1;                    //
                   if(OptMenu(COME_FROM_DEFAULT)==CALL_PAIR_MENU) // call menu function, and if pair menu was selected
                       PairMenu();             // call pair menu
                   return;                     // return - i.e. reset this function
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
 * OptMenu Function - This is the base menu function. It       *
 * displays the options based upon where is was called from.   *
 ***************************************************************/
unsigned char OptMenu(unsigned char z)
{
    /***********************************************
     * Variable Definitions                        *
     ***********************************************/
    int x;        // random support variable
    int update=1; // this variable is set when the screen needs to be updated
    
    const unsigned char AlternateDisplay[]="INDIV On/Off"; // alternate menu option
    
    struct MenuDisplay {            //
        unsigned char CurrentItem;  // holds the current selected option
        unsigned char Items[3][13]; // holds the names of all the options
    };
    struct MenuDisplay Menu ={
        0,                     // put zero in the current item variable
        "Standby",             // name of option one
        "All On/Off",          // name of option two (assuming it's not reloaded)
        "Back"                 // name of option three
    };
    
    /***********************************************
     * Main Code                                   *
     ***********************************************/
    if(z==COME_FROM_PAIR)                         // if this function was called from the pair menu function
        for(x=0;x<12;x++)                         // load the alternate menu option 
            Menu.Items[1][x]=AlternateDisplay[x]; //
    
    LCDwrcmd(0b00000001); // clear display
    __delay_ms(2);        // wait for the display to be cleared
    
    while(1) { // main code loop
        
        if(update){                                    // if the display needs to be updated
            LCDsetaddr(0x00);                          // set the address to the start of the display
            LCDwrchar(Menu.CurrentItem+1+0x30);        // write the current menu items number
            LCDwrstring(": ");                         //
            LCDwrstring(Menu.Items[Menu.CurrentItem]); // write the current option to the display
            LCDwrstring("        ");                   // clear the rest of the line
            LCDsetaddr(0x0F);                          // write the left arrow character on the last character space
            LCDwrchar(0x7F);                           //
            LCDsetaddr(0x40);                          // reset the address to the second line
            
            if(Menu.CurrentItem<2) {                         // if the second option should not be a blank line
                LCDwrchar(Menu.CurrentItem+2+0x30);          //     write the option after the current item to the second line
                LCDwrstring(": ");                           //
                LCDwrstring(Menu.Items[Menu.CurrentItem+1]); //
                LCDwrstring("        ");                     //     clear the rest of the line
            }                                                // 
            else                                             // else if the second line should be blank
                LCDwrstring("                ");             //     clear the line
            update=0;                                        // reset the update flag
        }
        if(SW3){                        // if the move down key was pressed
            __delay_ms(12);             // debounce
            if(SW3) {                   // if it's still pressed
                if(Menu.CurrentItem==2) // if the current item is the last option
                    Menu.CurrentItem=0; //     reset to the first option
                else                    // else
                    Menu.CurrentItem++; //     increment the current selection
                update=1;               // set the update flag so the display will show the new change
                while(SW3);             // wait for the switch to be let off of
            }
        }
        if(SW2){                        // if the move up key was pressed
            __delay_ms(12);             // debounce
            if(SW2) {                   // if it's still pressed
                if(Menu.CurrentItem==0) // if the current item is the first option
                    Menu.CurrentItem=2; //     set it to the last option
                else                    // else
                    Menu.CurrentItem--; //     de-increment the current selection
                update=1;               // set the update flag so the display will show the new change
                while(SW2);             // wait for the switch to be let off of
            }
        }
        if(SW1){                                    // if the select switch was pressed
            __delay_ms(12);                         // debounce
            if(SW1) {                               // if it's still pressed
                while(SW1);                         // wait for it to be let off of 
                switch(Menu.CurrentItem) {          // see what is selected
                    case 0:                         // if it's the standby option
                        StandbyMenu();              //     call the standby function
                        return(0);                  //     return to the function that called this function
                    case 1:                         // if it's the All On/Off/INDIV On/Off option
                        if(z==COME_FROM_PAIR)       //     check what fucntion called this one
                            return(RETURN_TO_DEFAULT); //  if it was the pair menu return with a message to return to default
                        else                        //     if was called by the default menu function return with a message to
                            return(CALL_PAIR_MENU); //     call the pair menu function
                    case 2:                         // if it's the back option
                        return(0);                  //     return
                }
            }
        }
    }
    return(0);
}

/***************************************************************
 * PairMenu Function                                            *
 ***************************************************************/
void PairMenu()
{
    /***********************************************
     * Variable Definitions                        *
     ***********************************************/
    static bit OnOrOff;       // 1 is on
    static bit CurrentSelect; // if 1, then the selection is "MENU".
    static bit Last;          // if 1, then the text is inverted  
    
    /***********************************************
     * Setup the display and relays                *
     ***********************************************/
    OnOrOff=0;       // clear each variable or it will have it's value from last time
    CurrentSelect=0; //
    Last=0;          //
    RL5V=1;          // turn off all relays
    RL12V=1;         //
    RL3V3=1;         //
    RLn12V=1;        //
    
    LCDsetaddr(0x00);                // write the menu to the display
    LCDwrstring("All Voltages:/  "); // 
    LCDsetaddr(0x40);                //
    LCDwrstring("            MENU"); //
    
    /***********************************************
     * Main Code Loop                              *
     ***********************************************/
    while(1) {    
        if(INTCONbits.TMR0IF) {          // if the blink flag is set
            if(CurrentSelect) {          // if the current selection is "MENU"
                LCDsetaddr(0x4C);        //     set the address to the start of the "MENU" text
                if(Last) {               //     if the text should be inverted
                    LCDwrchar(0x02);     //         write "MENU" inverted to the display
                    LCDwrchar(0x03);     //
                    LCDwrchar(0x04);     //
                    LCDwrchar(0x05);     //
                }                        //
                else                     //     else
                    LCDwrstring("MENU"); //         write "MENU" not inverted on the display 
            }                            //
            else {                       // else the selection is the power symbol
                LCDsetaddr(0x0D);        //     set the address to where the power symbol is  
                if(Last)                 //     if it should be inverted
                    LCDwrchar(OnOrOff ? 0x01:0x06);//then write the right symbol based upon if the voltages are on or off
                else                     //     else if it shouldn't be inverted
                    LCDwrchar(OnOrOff ? 0x00:'/');// then write the right symbol based upon if the voltages are on or off
            }                            //
            Last=~Last;                  // reset the last inverted state 
            INTCONbits.TMR0IF=0;         // clear the flag
        }
        
        if(SW3 || SW2) {                 // if the move up or move down button was pressed 
            __delay_ms(12);              // debounce
            if(SW3 || SW2) {             // if there still pressed
                if(CurrentSelect) {      // if the current selection is menu
                    LCDsetaddr(0x4C);    //     write "MENU" to make sure it's not inverted when the selection is changed
                    LCDwrstring("MENU"); //
                }                        //
                else {                   // else if the selection is the power symbol
                    LCDsetaddr(0x0D);    //     write the appropriate symbol to make sure it's not inverted when the selection is 
                    LCDwrchar(OnOrOff ? 0x00:'/');//changed
                }                        //
                
                CurrentSelect=~CurrentSelect; // swap the current selection
            }                                 //
            while(SW3 || SW2);                // wait for the switch to be let off of 
        }
        
        if(SW1) {                   // if the select switch was pressed
            __delay_ms(12);         // debounce
            if(SW1) {               // if SW1 is still pressed
                LCDsetaddr(0x0D);   // set the address to where the power symbol is 
                if(CurrentSelect) { // if the current selection is "MENU"
                    while(SW1);     // wait for the switch to be let off of 
                    if(OptMenu(COME_FROM_PAIR)==RETURN_TO_DEFAULT) { // if the user selects INDIV from OptMenu                               
                        RL5V=1;     // turn off all relays
                        RL12V=1;    //
                        RL3V3=1;    // 
                        RLn12V=1;   // 
                        return;     // return to the INDIV menu
                    }
                    LCDsetaddr(0x00);                // if the user wants to continue on this menu
                    LCDwrstring("All Voltages:");    //    redraw the menu
                    LCDwrchar(OnOrOff ? 0x00:'/');   //
                    LCDwrstring("  ");               //
                    LCDsetaddr(0x40);                //
                    LCDwrstring("            MENU"); //
                    
                }
                else {                // if the current selection is the power symbol
                    RL5V=~RL5V;       // switch the state of all the relays 
                    RL12V=~RL12V;     //
                    RL3V3=~RL3V3;     //
                    RLn12V=~RLn12V;   //
                    OnOrOff=~OnOrOff; // and switch the state of the OnOrOff variable
                    if(Last)          // redraw the display to reflect the changes 
                        LCDwrchar(OnOrOff ? 0x01:0x06); //
                    else              //
                        LCDwrchar(OnOrOff ? 0x00:'/'); //
                }                     //
                while(SW1);           // wait for the switch to be let off of 
            }
        }
    }
    return;
}


