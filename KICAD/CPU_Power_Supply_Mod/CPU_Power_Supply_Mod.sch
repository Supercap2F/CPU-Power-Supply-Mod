EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:Regulator
LIBS:PIC
LIBS:Passive
LIBS:FTDI
LIBS:user-regul
LIBS:user-reg
LIBS:user
LIBS:motors
LIBS:CPU_Power_Supply_Mod-cache
EELAYER 27 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "CPU Power Supply Mod "
Date "21 sep 2015"
Rev "1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 16X2_LCD U3
U 1 1 55FD6078
P 1450 3900
F 0 "U3" H 2550 3550 60  0000 C CNN
F 1 "16X2_LCD" H 1300 3550 60  0000 C CNN
F 2 "" H 1450 3900 60  0000 C CNN
F 3 "" H 1450 3900 60  0000 C CNN
	1    1450 3900
	0    -1   -1   0   
$EndComp
$Comp
L 74HC595N U2
U 1 1 55FD63E0
P 3650 3800
F 0 "U2" H 4000 3200 70  0000 C CNN
F 1 "74HC595N" H 3550 3200 70  0000 C CNN
F 2 "~" H 3650 3800 60  0000 C CNN
F 3 "~" H 3650 3800 60  0000 C CNN
	1    3650 3800
	-1   0    0    -1  
$EndComp
$Comp
L PIC18F1220 U1
U 1 1 55FD6BF8
P 6250 2450
F 0 "U1" H 7550 2400 60  0000 C CNN
F 1 "PIC18F1220" H 6000 2400 60  0000 C CNN
F 2 "~" H 6250 2450 60  0000 C CNN
F 3 "~" H 6250 2450 60  0000 C CNN
	1    6250 2450
	-1   0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 55FD6C07
P 4400 2600
F 0 "C1" H 4400 2700 40  0000 L CNN
F 1 "100n" H 4406 2515 40  0000 L CNN
F 2 "~" H 4438 2450 30  0000 C CNN
F 3 "~" H 4400 2600 60  0000 C CNN
	1    4400 2600
	0    1    1    0   
$EndComp
$Comp
L GND #PWR01
U 1 1 55FD6C25
P 4650 2750
F 0 "#PWR01" H 4650 2750 30  0001 C CNN
F 1 "GND" H 4650 2680 30  0001 C CNN
F 2 "" H 4650 2750 60  0000 C CNN
F 3 "" H 4650 2750 60  0000 C CNN
	1    4650 2750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 55FD6C46
P 4150 2650
F 0 "#PWR02" H 4150 2650 30  0001 C CNN
F 1 "GND" H 4150 2580 30  0001 C CNN
F 2 "" H 4150 2650 60  0000 C CNN
F 3 "" H 4150 2650 60  0000 C CNN
	1    4150 2650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 55FD6D53
P 2600 2900
F 0 "#PWR03" H 2600 2900 30  0001 C CNN
F 1 "GND" H 2600 2830 30  0001 C CNN
F 2 "" H 2600 2900 60  0000 C CNN
F 3 "" H 2600 2900 60  0000 C CNN
	1    2600 2900
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 55FD6D59
P 2800 2750
F 0 "C2" H 2800 2850 40  0000 L CNN
F 1 "100n" H 2806 2665 40  0000 L CNN
F 2 "~" H 2838 2600 30  0000 C CNN
F 3 "~" H 2800 2750 60  0000 C CNN
	1    2800 2750
	0    1    1    0   
$EndComp
$Comp
L GND #PWR04
U 1 1 55FD6FE7
P 3050 2800
F 0 "#PWR04" H 3050 2800 30  0001 C CNN
F 1 "GND" H 3050 2730 30  0001 C CNN
F 2 "" H 3050 2800 60  0000 C CNN
F 3 "" H 3050 2800 60  0000 C CNN
	1    3050 2800
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 55FD7453
P 4650 3750
F 0 "C3" H 4650 3850 40  0000 L CNN
F 1 "100n" H 4656 3665 40  0000 L CNN
F 2 "~" H 4688 3600 30  0000 C CNN
F 3 "~" H 4650 3750 60  0000 C CNN
	1    4650 3750
	0    1    1    0   
$EndComp
$Comp
L GND #PWR05
U 1 1 55FD745F
P 4400 3900
F 0 "#PWR05" H 4400 3900 30  0001 C CNN
F 1 "GND" H 4400 3830 30  0001 C CNN
F 2 "" H 4400 3900 60  0000 C CNN
F 3 "" H 4400 3900 60  0000 C CNN
	1    4400 3900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 55FD74D2
P 4900 3800
F 0 "#PWR06" H 4900 3800 30  0001 C CNN
F 1 "GND" H 4900 3730 30  0001 C CNN
F 2 "" H 4900 3800 60  0000 C CNN
F 3 "" H 4900 3800 60  0000 C CNN
	1    4900 3800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 55FD7500
P 4400 4300
F 0 "#PWR07" H 4400 4300 30  0001 C CNN
F 1 "GND" H 4400 4230 30  0001 C CNN
F 2 "" H 4400 4300 60  0000 C CNN
F 3 "" H 4400 4300 60  0000 C CNN
	1    4400 4300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 55FD7563
P 2550 4300
F 0 "#PWR08" H 2550 4300 30  0001 C CNN
F 1 "GND" H 2550 4230 30  0001 C CNN
F 2 "" H 2550 4300 60  0000 C CNN
F 3 "" H 2550 4300 60  0000 C CNN
	1    2550 4300
	1    0    0    -1  
$EndComp
$Comp
L CONN-12X2 P2
U 1 1 55FD7E9B
P 8700 3150
F 0 "P2" H 8700 3800 60  0000 C CNN
F 1 "ATX 2.x" V 8700 3150 50  0000 C CNN
F 2 "" H 8700 3150 60  0000 C CNN
F 3 "" H 8700 3150 60  0000 C CNN
	1    8700 3150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 55FD8165
P 9250 3150
F 0 "#PWR09" H 9250 3150 30  0001 C CNN
F 1 "GND" H 9250 3080 30  0001 C CNN
F 2 "" H 9250 3150 60  0000 C CNN
F 3 "" H 9250 3150 60  0000 C CNN
	1    9250 3150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 55FD8172
P 8150 2850
F 0 "#PWR010" H 8150 2850 30  0001 C CNN
F 1 "GND" H 8150 2780 30  0001 C CNN
F 2 "" H 8150 2850 60  0000 C CNN
F 3 "" H 8150 2850 60  0000 C CNN
	1    8150 2850
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR011
U 1 1 55FD8219
P 8250 2600
F 0 "#PWR011" H 8250 2560 30  0001 C CNN
F 1 "+3.3V" H 8250 2710 30  0000 C CNN
F 2 "" H 8250 2600 60  0000 C CNN
F 3 "" H 8250 2600 60  0000 C CNN
	1    8250 2600
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR012
U 1 1 55FD8226
P 9150 2600
F 0 "#PWR012" H 9150 2560 30  0001 C CNN
F 1 "+3.3V" H 9150 2710 30  0000 C CNN
F 2 "" H 9150 2600 60  0000 C CNN
F 3 "" H 9150 2600 60  0000 C CNN
	1    9150 2600
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR013
U 1 1 55FD822C
P 8150 3700
F 0 "#PWR013" H 8150 3660 30  0001 C CNN
F 1 "+3.3V" H 8150 3810 30  0000 C CNN
F 2 "" H 8150 3700 60  0000 C CNN
F 3 "" H 8150 3700 60  0000 C CNN
	1    8150 3700
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR014
U 1 1 55FD8234
P 8050 3550
F 0 "#PWR014" H 8050 3500 20  0001 C CNN
F 1 "+12V" H 8050 3650 30  0000 C CNN
F 2 "" H 8050 3550 60  0000 C CNN
F 3 "" H 8050 3550 60  0000 C CNN
	1    8050 3550
	1    0    0    -1  
$EndComp
$Comp
L +5VA #PWR015
U 1 1 55FD8243
P 8050 3400
F 0 "#PWR015" H 8050 3530 20  0001 C CNN
F 1 "+5VA" H 8050 3500 30  0000 C CNN
F 2 "" H 8050 3400 60  0000 C CNN
F 3 "" H 8050 3400 60  0000 C CNN
	1    8050 3400
	1    0    0    -1  
$EndComp
Text Label 8150 3300 0    60   ~ 0
PG
$Comp
L +5V #PWR016
U 1 1 55FD8427
P 8100 3050
F 0 "#PWR016" H 8100 3140 20  0001 C CNN
F 1 "+5V" H 8100 3140 30  0000 C CNN
F 2 "" H 8100 3050 60  0000 C CNN
F 3 "" H 8100 3050 60  0000 C CNN
	1    8100 3050
	1    0    0    -1  
$EndComp
$Comp
L -12V #PWR017
U 1 1 55FD848C
P 9250 2700
F 0 "#PWR017" H 9250 2830 20  0001 C CNN
F 1 "-12V" H 9250 2800 30  0000 C CNN
F 2 "" H 9250 2700 60  0000 C CNN
F 3 "" H 9250 2700 60  0000 C CNN
	1    9250 2700
	-1   0    0    1   
$EndComp
Text Label 9300 2900 2    60   ~ 0
PN
$Comp
L +5V #PWR018
U 1 1 55FD8553
P 9250 3500
F 0 "#PWR018" H 9250 3590 20  0001 C CNN
F 1 "+5V" H 9250 3590 30  0000 C CNN
F 2 "" H 9250 3500 60  0000 C CNN
F 3 "" H 9250 3500 60  0000 C CNN
	1    9250 3500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR019
U 1 1 55FD85BD
P 9150 3750
F 0 "#PWR019" H 9150 3750 30  0001 C CNN
F 1 "GND" H 9150 3680 30  0001 C CNN
F 2 "" H 9150 3750 60  0000 C CNN
F 3 "" H 9150 3750 60  0000 C CNN
	1    9150 3750
	1    0    0    -1  
$EndComp
$Comp
L +5VA #PWR020
U 1 1 55FD861B
P 4650 2550
F 0 "#PWR020" H 4650 2680 20  0001 C CNN
F 1 "+5VA" H 4650 2650 30  0000 C CNN
F 2 "" H 4650 2550 60  0000 C CNN
F 3 "" H 4650 2550 60  0000 C CNN
	1    4650 2550
	1    0    0    -1  
$EndComp
$Comp
L +5VA #PWR021
U 1 1 55FD862B
P 2550 4150
F 0 "#PWR021" H 2550 4280 20  0001 C CNN
F 1 "+5VA" H 2650 4200 30  0000 C CNN
F 2 "" H 2550 4150 60  0000 C CNN
F 3 "" H 2550 4150 60  0000 C CNN
	1    2550 4150
	1    0    0    -1  
$EndComp
$Comp
L +5VA #PWR022
U 1 1 55FD8631
P 2550 2700
F 0 "#PWR022" H 2550 2830 20  0001 C CNN
F 1 "+5VA" H 2550 2800 30  0000 C CNN
F 2 "" H 2550 2700 60  0000 C CNN
F 3 "" H 2550 2700 60  0000 C CNN
	1    2550 2700
	1    0    0    -1  
$EndComp
$Comp
L +5VA #PWR023
U 1 1 55FD865B
P 4400 4100
F 0 "#PWR023" H 4400 4230 20  0001 C CNN
F 1 "+5VA" H 4400 4200 30  0000 C CNN
F 2 "" H 4400 4100 60  0000 C CNN
F 3 "" H 4400 4100 60  0000 C CNN
	1    4400 4100
	1    0    0    -1  
$EndComp
$Comp
L +5VA #PWR024
U 1 1 55FD8661
P 4400 3700
F 0 "#PWR024" H 4400 3830 20  0001 C CNN
F 1 "+5VA" H 4400 3800 30  0000 C CNN
F 2 "" H 4400 3700 60  0000 C CNN
F 3 "" H 4400 3700 60  0000 C CNN
	1    4400 3700
	1    0    0    -1  
$EndComp
$Comp
L POT RV1
U 1 1 55FD896D
P 3350 2750
F 0 "RV1" H 3350 2650 50  0000 C CNN
F 1 "POT" H 3350 2750 50  0000 C CNN
F 2 "~" H 3350 2750 60  0000 C CNN
F 3 "~" H 3350 2750 60  0000 C CNN
	1    3350 2750
	-1   0    0    1   
$EndComp
$Comp
L +5VA #PWR025
U 1 1 55FD89F6
P 3650 2700
F 0 "#PWR025" H 3650 2830 20  0001 C CNN
F 1 "+5VA" H 3650 2800 30  0000 C CNN
F 2 "" H 3650 2700 60  0000 C CNN
F 3 "" H 3650 2700 60  0000 C CNN
	1    3650 2700
	1    0    0    -1  
$EndComp
$Comp
L CONN_6 P1
U 1 1 55FD8B47
P 7700 2650
F 0 "P1" V 7650 2650 60  0000 C CNN
F 1 "ICSP" V 7750 2650 60  0000 C CNN
F 2 "" H 7700 2650 60  0000 C CNN
F 3 "" H 7700 2650 60  0000 C CNN
	1    7700 2650
	1    0    0    -1  
$EndComp
$Comp
L +5VA #PWR026
U 1 1 55FD8F37
P 7250 2350
F 0 "#PWR026" H 7250 2480 20  0001 C CNN
F 1 "+5VA" H 7250 2450 30  0000 C CNN
F 2 "" H 7250 2350 60  0000 C CNN
F 3 "" H 7250 2350 60  0000 C CNN
	1    7250 2350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR027
U 1 1 55FD8F46
P 7250 2650
F 0 "#PWR027" H 7250 2650 30  0001 C CNN
F 1 "GND" H 7250 2580 30  0001 C CNN
F 2 "" H 7250 2650 60  0000 C CNN
F 3 "" H 7250 2650 60  0000 C CNN
	1    7250 2650
	1    0    0    -1  
$EndComp
$Comp
L RELAY_SPST K1
U 1 1 55FD9741
P 4900 4950
F 0 "K1" H 4800 4450 70  0000 C CNN
F 1 "RELAY_SPST" H 5050 4450 70  0001 C CNN
F 2 "~" H 4800 4950 60  0000 C CNN
F 3 "~" H 4800 4950 60  0000 C CNN
	1    4900 4950
	-1   0    0    1   
$EndComp
$Comp
L PNP Q1
U 1 1 55FD9C3D
P 5250 4100
F 0 "Q1" H 5300 3850 60  0000 R CNN
F 1 "PN2907" H 5250 3950 60  0000 R CNN
F 2 "~" H 5250 4100 60  0000 C CNN
F 3 "~" H 5250 4100 60  0000 C CNN
	1    5250 4100
	-1   0    0    1   
$EndComp
$Comp
L DIODE D1
U 1 1 55FD9DFF
P 5350 4500
F 0 "D1" H 5350 4600 40  0000 C CNN
F 1 "DIODE" H 5350 4400 40  0001 C CNN
F 2 "~" H 5350 4500 60  0000 C CNN
F 3 "~" H 5350 4500 60  0000 C CNN
	1    5350 4500
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR028
U 1 1 55FD9FA7
P 5250 4750
F 0 "#PWR028" H 5250 4750 30  0001 C CNN
F 1 "GND" H 5250 4680 30  0001 C CNN
F 2 "" H 5250 4750 60  0000 C CNN
F 3 "" H 5250 4750 60  0000 C CNN
	1    5250 4750
	1    0    0    -1  
$EndComp
$Comp
L +5VA #PWR029
U 1 1 55FD9FB6
P 5150 3850
F 0 "#PWR029" H 5150 3980 20  0001 C CNN
F 1 "+5VA" H 5150 3950 30  0000 C CNN
F 2 "" H 5150 3850 60  0000 C CNN
F 3 "" H 5150 3850 60  0000 C CNN
	1    5150 3850
	1    0    0    -1  
$EndComp
$Comp
L RELAY_SPST K2
U 1 1 55FDA0D2
P 5550 4950
F 0 "K2" H 5450 4450 70  0000 C CNN
F 1 "RELAY_SPST" H 5700 4450 70  0001 C CNN
F 2 "~" H 5450 4950 60  0000 C CNN
F 3 "~" H 5450 4950 60  0000 C CNN
	1    5550 4950
	-1   0    0    1   
$EndComp
$Comp
L PNP Q2
U 1 1 55FDA0D8
P 5900 4100
F 0 "Q2" H 5950 3850 60  0000 R CNN
F 1 "PN2907" H 5900 3950 60  0000 R CNN
F 2 "~" H 5900 4100 60  0000 C CNN
F 3 "~" H 5900 4100 60  0000 C CNN
	1    5900 4100
	-1   0    0    1   
$EndComp
$Comp
L DIODE D2
U 1 1 55FDA0DE
P 6000 4500
F 0 "D2" H 6000 4600 40  0000 C CNN
F 1 "DIODE" H 6000 4400 40  0001 C CNN
F 2 "~" H 6000 4500 60  0000 C CNN
F 3 "~" H 6000 4500 60  0000 C CNN
	1    6000 4500
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR030
U 1 1 55FDA0E7
P 5900 4750
F 0 "#PWR030" H 5900 4750 30  0001 C CNN
F 1 "GND" H 5900 4680 30  0001 C CNN
F 2 "" H 5900 4750 60  0000 C CNN
F 3 "" H 5900 4750 60  0000 C CNN
	1    5900 4750
	1    0    0    -1  
$EndComp
$Comp
L +5VA #PWR031
U 1 1 55FDA0ED
P 5800 3850
F 0 "#PWR031" H 5800 3980 20  0001 C CNN
F 1 "+5VA" H 5800 3950 30  0000 C CNN
F 2 "" H 5800 3850 60  0000 C CNN
F 3 "" H 5800 3850 60  0000 C CNN
	1    5800 3850
	1    0    0    -1  
$EndComp
$Comp
L RELAY_SPST K3
U 1 1 55FDA0F6
P 6200 4950
F 0 "K3" H 6100 4450 70  0000 C CNN
F 1 "RELAY_SPST" H 6350 4450 70  0001 C CNN
F 2 "~" H 6100 4950 60  0000 C CNN
F 3 "~" H 6100 4950 60  0000 C CNN
	1    6200 4950
	-1   0    0    1   
$EndComp
$Comp
L PNP Q3
U 1 1 55FDA0FC
P 6550 4100
F 0 "Q3" H 6600 3850 60  0000 R CNN
F 1 "PN2907" H 6550 3950 60  0000 R CNN
F 2 "~" H 6550 4100 60  0000 C CNN
F 3 "~" H 6550 4100 60  0000 C CNN
	1    6550 4100
	-1   0    0    1   
$EndComp
$Comp
L DIODE D3
U 1 1 55FDA102
P 6650 4500
F 0 "D3" H 6650 4600 40  0000 C CNN
F 1 "DIODE" H 6650 4400 40  0001 C CNN
F 2 "~" H 6650 4500 60  0000 C CNN
F 3 "~" H 6650 4500 60  0000 C CNN
	1    6650 4500
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR032
U 1 1 55FDA10B
P 6550 4750
F 0 "#PWR032" H 6550 4750 30  0001 C CNN
F 1 "GND" H 6550 4680 30  0001 C CNN
F 2 "" H 6550 4750 60  0000 C CNN
F 3 "" H 6550 4750 60  0000 C CNN
	1    6550 4750
	1    0    0    -1  
$EndComp
$Comp
L +5VA #PWR033
U 1 1 55FDA111
P 6450 3850
F 0 "#PWR033" H 6450 3980 20  0001 C CNN
F 1 "+5VA" H 6450 3950 30  0000 C CNN
F 2 "" H 6450 3850 60  0000 C CNN
F 3 "" H 6450 3850 60  0000 C CNN
	1    6450 3850
	1    0    0    -1  
$EndComp
$Comp
L RELAY_SPST K4
U 1 1 55FDA11A
P 6850 4950
F 0 "K4" H 6750 4450 70  0000 C CNN
F 1 "RELAY_SPST" H 7000 4450 70  0001 C CNN
F 2 "~" H 6750 4950 60  0000 C CNN
F 3 "~" H 6750 4950 60  0000 C CNN
	1    6850 4950
	-1   0    0    1   
$EndComp
$Comp
L PNP Q4
U 1 1 55FDA120
P 7200 4100
F 0 "Q4" H 7250 3850 60  0000 R CNN
F 1 "PN2907" H 7200 3950 60  0000 R CNN
F 2 "~" H 7200 4100 60  0000 C CNN
F 3 "~" H 7200 4100 60  0000 C CNN
	1    7200 4100
	-1   0    0    1   
$EndComp
$Comp
L DIODE D4
U 1 1 55FDA126
P 7300 4500
F 0 "D4" H 7300 4600 40  0000 C CNN
F 1 "DIODE" H 7300 4400 40  0001 C CNN
F 2 "~" H 7300 4500 60  0000 C CNN
F 3 "~" H 7300 4500 60  0000 C CNN
	1    7300 4500
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR034
U 1 1 55FDA12F
P 7200 4750
F 0 "#PWR034" H 7200 4750 30  0001 C CNN
F 1 "GND" H 7200 4680 30  0001 C CNN
F 2 "" H 7200 4750 60  0000 C CNN
F 3 "" H 7200 4750 60  0000 C CNN
	1    7200 4750
	1    0    0    -1  
$EndComp
$Comp
L +5VA #PWR035
U 1 1 55FDA135
P 7100 3850
F 0 "#PWR035" H 7100 3980 20  0001 C CNN
F 1 "+5VA" H 7100 3950 30  0000 C CNN
F 2 "" H 7100 3850 60  0000 C CNN
F 3 "" H 7100 3850 60  0000 C CNN
	1    7100 3850
	1    0    0    -1  
$EndComp
$Comp
L -12V #PWR036
U 1 1 55FDA140
P 7150 5450
F 0 "#PWR036" H 7150 5580 20  0001 C CNN
F 1 "-12V" H 7150 5550 30  0000 C CNN
F 2 "" H 7150 5450 60  0000 C CNN
F 3 "" H 7150 5450 60  0000 C CNN
	1    7150 5450
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR037
U 1 1 55FDA14F
P 5650 5450
F 0 "#PWR037" H 5650 5540 20  0001 C CNN
F 1 "+5V" H 5650 5550 30  0000 C CNN
F 2 "" H 5650 5450 60  0000 C CNN
F 3 "" H 5650 5450 60  0000 C CNN
	1    5650 5450
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR038
U 1 1 55FDA16D
P 5200 4900
F 0 "#PWR038" H 5200 4860 30  0001 C CNN
F 1 "+3.3V" H 5300 4950 30  0000 C CNN
F 2 "" H 5200 4900 60  0000 C CNN
F 3 "" H 5200 4900 60  0000 C CNN
	1    5200 4900
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR039
U 1 1 55FDA186
P 6500 4900
F 0 "#PWR039" H 6500 4850 20  0001 C CNN
F 1 "+12V" H 6600 4950 30  0000 C CNN
F 2 "" H 6500 4900 60  0000 C CNN
F 3 "" H 6500 4900 60  0000 C CNN
	1    6500 4900
	1    0    0    -1  
$EndComp
$Comp
L FUSE F1
U 1 1 55FDA3D9
P 4700 5300
F 0 "F1" H 4800 5350 40  0000 C CNN
F 1 "2.5A" H 4600 5250 40  0000 C CNN
F 2 "~" H 4700 5300 60  0000 C CNN
F 3 "~" H 4700 5300 60  0000 C CNN
	1    4700 5300
	0    -1   -1   0   
$EndComp
$Comp
L FUSE F2
U 1 1 55FDA3E6
P 5800 5200
F 0 "F2" H 5900 5250 40  0000 C CNN
F 1 "2.5A" H 5700 5150 40  0000 C CNN
F 2 "~" H 5800 5200 60  0000 C CNN
F 3 "~" H 5800 5200 60  0000 C CNN
	1    5800 5200
	0    -1   -1   0   
$EndComp
$Comp
L FUSE F3
U 1 1 55FDA3EC
P 6000 5300
F 0 "F3" H 6100 5350 40  0000 C CNN
F 1 "2.5A" H 5900 5250 40  0000 C CNN
F 2 "~" H 6000 5300 60  0000 C CNN
F 3 "~" H 6000 5300 60  0000 C CNN
	1    6000 5300
	0    -1   -1   0   
$EndComp
$Comp
L FUSE F4
U 1 1 55FDA3FC
P 7150 5150
F 0 "F4" H 7250 5200 40  0000 C CNN
F 1 "FUSE" H 7050 5100 40  0000 C CNN
F 2 "~" H 7150 5150 60  0000 C CNN
F 3 "~" H 7150 5150 60  0000 C CNN
	1    7150 5150
	0    -1   -1   0   
$EndComp
$Comp
L CONN_6 P3
U 1 1 55FDA6CE
P 5750 6300
F 0 "P3" V 5700 6300 60  0000 C CNN
F 1 "PWR OUT" V 5800 6300 60  0000 C CNN
F 2 "" H 5750 6300 60  0000 C CNN
F 3 "" H 5750 6300 60  0000 C CNN
	1    5750 6300
	0    -1   1    0   
$EndComp
$Comp
L GND #PWR040
U 1 1 55FDA9E2
P 5400 5900
F 0 "#PWR040" H 5400 5900 30  0001 C CNN
F 1 "GND" H 5400 5830 30  0001 C CNN
F 2 "" H 5400 5900 60  0000 C CNN
F 3 "" H 5400 5900 60  0000 C CNN
	1    5400 5900
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 55FDAA8E
P 7250 3450
F 0 "R4" V 7250 3550 40  0000 C CNN
F 1 "R" V 7250 3350 40  0000 C CNN
F 2 "~" V 7180 3450 30  0000 C CNN
F 3 "~" H 7250 3450 30  0000 C CNN
	1    7250 3450
	0    1    -1   0   
$EndComp
$Comp
L R R3
U 1 1 55FDAA9B
P 7250 3550
F 0 "R3" V 7250 3650 40  0000 C CNN
F 1 "R" V 7250 3450 40  0000 C CNN
F 2 "~" V 7180 3550 30  0000 C CNN
F 3 "~" H 7250 3550 30  0000 C CNN
	1    7250 3550
	0    1    -1   0   
$EndComp
$Comp
L R R2
U 1 1 55FDAAA1
P 8950 5000
F 0 "R2" V 8950 5100 40  0000 C CNN
F 1 "R" V 8950 4900 40  0000 C CNN
F 2 "~" V 8880 5000 30  0000 C CNN
F 3 "~" H 8950 5000 30  0000 C CNN
	1    8950 5000
	0    1    1    0   
$EndComp
$Comp
L R R1
U 1 1 55FDAAA7
P 8950 4900
F 0 "R1" V 8950 5000 40  0000 C CNN
F 1 "R" V 8950 4800 40  0000 C CNN
F 2 "~" V 8880 4900 30  0000 C CNN
F 3 "~" H 8950 4900 30  0000 C CNN
	1    8950 4900
	0    1    1    0   
$EndComp
Text Label 5600 4100 2    60   ~ 0
ON1
Text Label 6250 4100 2    60   ~ 0
ON2
Text Label 6900 4100 2    60   ~ 0
ON3
Text Label 7550 4100 2    60   ~ 0
ON4
Text Label 9400 4900 2    60   ~ 0
ON1
Text Label 9400 5000 2    60   ~ 0
ON2
Text Label 7700 3550 2    60   ~ 0
ON3
Text Label 7700 3450 2    60   ~ 0
ON4
$Comp
L SW_PUSH SW1
U 1 1 55FDB359
P 8200 4100
F 0 "SW1" H 8350 4210 50  0000 C CNN
F 1 "SW_PUSH" H 8200 4020 50  0001 C CNN
F 2 "~" H 8200 4100 60  0000 C CNN
F 3 "~" H 8200 4100 60  0000 C CNN
	1    8200 4100
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW2
U 1 1 55FDB366
P 8200 4350
F 0 "SW2" H 8350 4460 50  0000 C CNN
F 1 "SW_PUSH" H 8200 4270 50  0001 C CNN
F 2 "~" H 8200 4350 60  0000 C CNN
F 3 "~" H 8200 4350 60  0000 C CNN
	1    8200 4350
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW3
U 1 1 55FDB36C
P 8200 4600
F 0 "SW3" H 8350 4710 50  0000 C CNN
F 1 "SW_PUSH" H 8200 4520 50  0001 C CNN
F 2 "~" H 8200 4600 60  0000 C CNN
F 3 "~" H 8200 4600 60  0000 C CNN
	1    8200 4600
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 55FDB372
P 8950 4100
F 0 "R5" V 8950 4200 40  0000 C CNN
F 1 "R" V 8950 4000 40  0000 C CNN
F 2 "~" V 8880 4100 30  0000 C CNN
F 3 "~" H 8950 4100 30  0000 C CNN
	1    8950 4100
	0    1    1    0   
$EndComp
$Comp
L R R6
U 1 1 55FDB378
P 8950 4350
F 0 "R6" V 8950 4450 40  0000 C CNN
F 1 "R" V 8950 4250 40  0000 C CNN
F 2 "~" V 8880 4350 30  0000 C CNN
F 3 "~" H 8950 4350 30  0000 C CNN
	1    8950 4350
	0    1    1    0   
$EndComp
$Comp
L R R7
U 1 1 55FDB37E
P 8950 4600
F 0 "R7" V 8950 4700 40  0000 C CNN
F 1 "R" V 8950 4500 40  0000 C CNN
F 2 "~" V 8880 4600 30  0000 C CNN
F 3 "~" H 8950 4600 30  0000 C CNN
	1    8950 4600
	0    1    1    0   
$EndComp
Wire Wire Line
	2950 3350 2500 3350
Wire Wire Line
	2500 3450 2950 3450
Wire Wire Line
	2950 3550 2500 3550
Wire Wire Line
	2500 3650 2950 3650
Wire Wire Line
	2950 3750 2500 3750
Wire Wire Line
	2500 3850 2950 3850
Wire Wire Line
	2950 3950 2500 3950
Wire Wire Line
	2500 4050 2950 4050
Wire Wire Line
	4150 2650 4150 2600
Wire Wire Line
	4150 2600 4200 2600
Wire Wire Line
	4600 2600 4700 2600
Wire Wire Line
	4650 2600 4650 2550
Connection ~ 4650 2600
Wire Wire Line
	4700 2700 4650 2700
Wire Wire Line
	4650 2700 4650 2750
Wire Wire Line
	2500 2850 2600 2850
Wire Wire Line
	2500 2750 2600 2750
Wire Wire Line
	2550 2700 2550 2750
Connection ~ 2550 2750
Wire Wire Line
	3000 2750 3100 2750
Wire Wire Line
	3050 2750 3050 2800
Wire Wire Line
	4350 3350 4700 3350
Wire Wire Line
	4700 3450 4350 3450
Wire Wire Line
	4350 3550 4700 3550
Wire Wire Line
	4100 3250 4700 3250
Wire Wire Line
	4100 3200 4100 3250
Wire Wire Line
	2500 3250 3200 3250
Wire Wire Line
	2500 3150 4700 3150
Wire Wire Line
	4700 3050 2500 3050
Wire Wire Line
	3200 3250 3200 3200
Wire Wire Line
	3200 3200 4100 3200
Wire Wire Line
	4350 3750 4450 3750
Wire Wire Line
	4400 3700 4400 3750
Connection ~ 4400 3750
Wire Wire Line
	4350 3850 4400 3850
Wire Wire Line
	4400 3850 4400 3900
Wire Wire Line
	4850 3750 4900 3750
Wire Wire Line
	4900 3750 4900 3800
Wire Wire Line
	4350 4150 4400 4150
Wire Wire Line
	4400 4150 4400 4100
Wire Wire Line
	4350 4250 4400 4250
Wire Wire Line
	4400 4250 4400 4300
Wire Wire Line
	2500 4250 2550 4250
Wire Wire Line
	2550 4250 2550 4300
Wire Wire Line
	2500 4150 2550 4150
Wire Wire Line
	8300 2700 8250 2700
Wire Wire Line
	8250 2700 8250 2600
Wire Wire Line
	8250 2600 8300 2600
Wire Wire Line
	8150 2800 8300 2800
Wire Wire Line
	8250 2800 8250 3200
Wire Wire Line
	8250 3000 8300 3000
Wire Wire Line
	8250 3200 8300 3200
Connection ~ 8250 3000
Wire Wire Line
	8200 3100 8300 3100
Wire Wire Line
	8200 2900 8200 3100
Wire Wire Line
	8200 2900 8300 2900
Wire Wire Line
	8300 3500 8250 3500
Wire Wire Line
	8250 3500 8250 3600
Wire Wire Line
	8250 3600 8300 3600
Wire Wire Line
	9150 2600 9100 2600
Wire Wire Line
	9100 2800 9150 2800
Wire Wire Line
	9150 2800 9150 3200
Wire Wire Line
	9150 3000 9100 3000
Wire Wire Line
	9100 3100 9250 3100
Connection ~ 9150 3000
Wire Wire Line
	9150 3200 9100 3200
Connection ~ 9150 3100
Wire Wire Line
	9100 3400 9150 3400
Wire Wire Line
	9150 3400 9150 3600
Wire Wire Line
	9150 3600 9100 3600
Wire Wire Line
	9100 3500 9250 3500
Connection ~ 9150 3500
Wire Wire Line
	8150 2850 8150 2800
Connection ~ 8250 2800
Wire Wire Line
	9250 3100 9250 3150
Wire Wire Line
	8050 3550 8250 3550
Connection ~ 8250 3550
Wire Wire Line
	8300 3700 8150 3700
Wire Wire Line
	8300 3300 8150 3300
Wire Wire Line
	8300 3400 8050 3400
Wire Wire Line
	8100 3050 8200 3050
Connection ~ 8200 3050
Wire Wire Line
	9100 2700 9250 2700
Wire Wire Line
	9100 2900 9300 2900
Wire Wire Line
	9100 3700 9150 3700
Wire Wire Line
	9150 3700 9150 3750
Wire Wire Line
	2600 2850 2600 2900
Wire Wire Line
	2500 2950 3350 2950
Wire Wire Line
	3350 2950 3350 2900
Connection ~ 3050 2750
Wire Wire Line
	3650 2700 3650 2750
Wire Wire Line
	3650 2750 3600 2750
Wire Wire Line
	6950 2700 7350 2700
Wire Wire Line
	7350 2800 6950 2800
Wire Wire Line
	6950 2600 6950 2400
Wire Wire Line
	6950 2400 7350 2400
Wire Wire Line
	7350 2600 7250 2600
Wire Wire Line
	7250 2600 7250 2650
Wire Wire Line
	7350 2500 7250 2500
Wire Wire Line
	7250 2500 7250 2350
Wire Wire Line
	5150 4600 5150 4300
Wire Wire Line
	5150 4300 5350 4300
Wire Wire Line
	5150 4700 5350 4700
Wire Wire Line
	5150 3850 5150 3900
Wire Wire Line
	5250 4750 5250 4700
Connection ~ 5250 4700
Wire Wire Line
	5800 4600 5800 4300
Wire Wire Line
	5800 4300 6000 4300
Wire Wire Line
	5800 4700 6000 4700
Wire Wire Line
	5800 3850 5800 3900
Wire Wire Line
	5900 4750 5900 4700
Connection ~ 5900 4700
Wire Wire Line
	6450 4600 6450 4300
Wire Wire Line
	6450 4300 6650 4300
Wire Wire Line
	6450 4700 6650 4700
Wire Wire Line
	6450 3850 6450 3900
Wire Wire Line
	6550 4750 6550 4700
Connection ~ 6550 4700
Wire Wire Line
	7100 4600 7100 4300
Wire Wire Line
	7100 4300 7300 4300
Wire Wire Line
	7100 4700 7300 4700
Wire Wire Line
	7100 3850 7100 3900
Wire Wire Line
	7200 4750 7200 4700
Connection ~ 7200 4700
Wire Wire Line
	5150 4900 5200 4900
Wire Wire Line
	5800 4900 5800 4900
Wire Wire Line
	6450 4900 6500 4900
Wire Wire Line
	7100 4900 7150 4900
Wire Wire Line
	6650 5000 6650 5850
Wire Wire Line
	6650 5000 6700 5000
Wire Wire Line
	6000 5050 6000 5000
Wire Wire Line
	6000 5000 6050 5000
Wire Wire Line
	5350 5000 5350 5600
Wire Wire Line
	5350 5000 5400 5000
Wire Wire Line
	4700 5050 4700 5000
Wire Wire Line
	4700 5000 4750 5000
Wire Wire Line
	6000 5550 6000 5750
Wire Wire Line
	6000 5850 6000 5950
Wire Wire Line
	6650 5850 6000 5850
Wire Wire Line
	5350 5600 5900 5600
Wire Wire Line
	4700 5550 4700 5750
Wire Wire Line
	4700 5750 5600 5750
Wire Wire Line
	5600 5750 5600 5950
Wire Wire Line
	5500 5950 5500 5850
Wire Wire Line
	5400 5850 5800 5850
Wire Wire Line
	5800 5850 5800 5950
Wire Wire Line
	5400 5900 5400 5850
Connection ~ 5500 5850
Wire Wire Line
	7000 3550 6950 3550
Wire Wire Line
	6950 3450 7000 3450
Wire Wire Line
	8700 5000 8650 5000
Wire Wire Line
	8650 4900 8700 4900
Wire Wire Line
	5450 4100 5600 4100
Wire Wire Line
	6100 4100 6250 4100
Wire Wire Line
	6750 4100 6900 4100
Wire Wire Line
	7400 4100 7550 4100
Wire Wire Line
	9400 4900 9200 4900
Wire Wire Line
	9200 5000 9400 5000
Wire Wire Line
	7700 3550 7500 3550
Wire Wire Line
	7500 3450 7700 3450
Wire Wire Line
	7850 4600 7900 4600
Wire Wire Line
	7850 4100 7850 4600
Wire Wire Line
	7850 4100 7900 4100
Wire Wire Line
	7900 4350 7850 4350
Connection ~ 7850 4350
Wire Wire Line
	9200 4100 9250 4100
Wire Wire Line
	9250 4100 9250 4650
Wire Wire Line
	9250 4600 9200 4600
Wire Wire Line
	9200 4350 9250 4350
Connection ~ 9250 4350
Wire Wire Line
	8700 4100 8500 4100
Wire Wire Line
	8500 4350 8700 4350
Wire Wire Line
	8700 4600 8500 4600
Text Label 8700 4100 2    60   ~ 0
SW1
Text Label 8700 4350 2    60   ~ 0
SW2
Text Label 8700 4600 2    60   ~ 0
SW3
$Comp
L +5VA #PWR041
U 1 1 55FDB9C0
P 7850 4100
F 0 "#PWR041" H 7850 4230 20  0001 C CNN
F 1 "+5VA" H 7850 4200 30  0000 C CNN
F 2 "" H 7850 4100 60  0000 C CNN
F 3 "" H 7850 4100 60  0000 C CNN
	1    7850 4100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR042
U 1 1 55FDB9C6
P 9250 4650
F 0 "#PWR042" H 9250 4650 30  0001 C CNN
F 1 "GND" H 9250 4580 30  0001 C CNN
F 2 "" H 9250 4650 60  0000 C CNN
F 3 "" H 9250 4650 60  0000 C CNN
	1    9250 4650
	1    0    0    -1  
$EndComp
Connection ~ 9250 4600
Text Label 7150 2950 2    60   ~ 0
SW1
Text Label 7150 3050 2    60   ~ 0
SW2
Text Label 7150 3150 2    60   ~ 0
SW3
Wire Wire Line
	7150 3150 6950 3150
Wire Wire Line
	6950 3050 7150 3050
Wire Wire Line
	7150 2950 6950 2950
Text Label 7150 2700 2    60   ~ 0
PGD
Text Label 7150 2800 2    60   ~ 0
PGC
$Comp
L CONN_2X2 P4
U 1 1 55FDC0CC
P 8250 4950
F 0 "P4" H 8250 5100 50  0000 C CNN
F 1 "PG SWT" H 8260 4820 40  0000 C CNN
F 2 "" H 8250 4950 60  0000 C CNN
F 3 "" H 8250 4950 60  0000 C CNN
	1    8250 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 4900 7700 4900
Wire Wire Line
	7850 5000 7700 5000
Text Label 7700 4900 0    60   ~ 0
PGD
Text Label 7700 5000 0    60   ~ 0
PGC
Wire Wire Line
	6950 3350 7150 3350
Wire Wire Line
	6950 3250 7150 3250
Text Label 7150 3350 2    60   ~ 0
PG
Text Label 7150 3250 2    60   ~ 0
PN
Wire Wire Line
	7150 5400 7150 5450
Wire Wire Line
	5800 4900 5800 4950
Wire Wire Line
	5800 5450 5800 5500
Wire Wire Line
	5800 5500 5650 5500
Wire Wire Line
	5650 5500 5650 5450
Wire Wire Line
	5700 5750 5700 5950
Wire Wire Line
	5900 5600 5900 5950
Wire Wire Line
	6000 5750 5700 5750
$EndSCHEMATC
