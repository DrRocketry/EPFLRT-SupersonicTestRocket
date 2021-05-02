EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L PCB_v1-rescue:ADIS16470-custom_lib U?
U 1 1 6150575B
P 3950 5400
AR Path="/6150575B" Ref="U?"  Part="1" 
AR Path="/614D955F/6150575B" Ref="U9"  Part="1" 
F 0 "U9" H 4150 5665 50  0000 C CNN
F 1 "ADIS16470" H 4150 5574 50  0000 C CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_2x08_P2.00mm_Vertical" H 4150 5450 50  0001 C CNN
F 3 "" H 4150 5450 50  0001 C CNN
	1    3950 5400
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 61505761
P 4650 5350
AR Path="/61505761" Ref="R?"  Part="1" 
AR Path="/614D955F/61505761" Ref="R12"  Part="1" 
F 0 "R12" V 4443 5350 50  0000 C CNN
F 1 "10kΩ" V 4534 5350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4580 5350 50  0001 C CNN
F 3 "~" H 4650 5350 50  0001 C CNN
	1    4650 5350
	0    1    1    0   
$EndComp
$Comp
L 2021-04-13_10-41-02:AIS1120SXTR U?
U 1 1 61505767
P 5700 3800
AR Path="/61505767" Ref="U?"  Part="1" 
AR Path="/614D955F/61505767" Ref="U10"  Part="1" 
F 0 "U10" H 6500 4187 60  0000 C CNN
F 1 "AIS1120SXTR" H 6500 4081 60  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 6500 4040 60  0001 C CNN
F 3 "" H 5700 3800 60  0000 C CNN
	1    5700 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6150576D
P 4800 3850
AR Path="/6150576D" Ref="R?"  Part="1" 
AR Path="/614D955F/6150576D" Ref="R13"  Part="1" 
F 0 "R13" H 4870 3896 50  0000 L CNN
F 1 "10kΩ" H 4870 3805 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4730 3850 50  0001 C CNN
F 3 "~" H 4800 3850 50  0001 C CNN
	1    4800 3850
	1    0    0    -1  
$EndComp
$Comp
L pspice:C C?
U 1 1 61505773
P 7900 4350
AR Path="/61505773" Ref="C?"  Part="1" 
AR Path="/614D955F/61505773" Ref="C6"  Part="1" 
F 0 "C6" H 8078 4396 50  0000 L CNN
F 1 "1uF +/- 10% 10V" H 8078 4305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.1mm_W3.2mm_P5.00mm" H 7900 4350 50  0001 C CNN
F 3 "~" H 7900 4350 50  0001 C CNN
	1    7900 4350
	1    0    0    -1  
$EndComp
$Comp
L pspice:C C?
U 1 1 61505779
P 8950 4350
AR Path="/61505779" Ref="C?"  Part="1" 
AR Path="/614D955F/61505779" Ref="C7"  Part="1" 
F 0 "C7" H 9128 4396 50  0000 L CNN
F 1 "0.1uF +/- 10% 10V" H 9128 4305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 8950 4350 50  0001 C CNN
F 3 "~" H 8950 4350 50  0001 C CNN
	1    8950 4350
	1    0    0    -1  
$EndComp
Text HLabel 3100 3800 0    50   Input ~ 0
MOSI0
Text HLabel 3100 4000 0    50   Input ~ 0
SCK0
Text HLabel 3100 3900 0    50   Input ~ 0
MISO0
Text HLabel 3100 4400 0    50   Input ~ 0
SYNC_ADIS16470
Text HLabel 3100 4300 0    50   Input ~ 0
DR_ADIS16470
Text HLabel 3100 4200 0    50   Input ~ 0
CS_ADIS16470
Text HLabel 3100 4100 0    50   Input ~ 0
CS_AIS1120
Wire Wire Line
	4100 4950 4900 4950
Wire Wire Line
	5650 4950 5650 4850
$Comp
L power:+3.3V #PWR020
U 1 1 6155A344
P 5650 4850
F 0 "#PWR020" H 5650 4700 50  0001 C CNN
F 1 "+3.3V" H 5665 5023 50  0000 C CNN
F 2 "" H 5650 4850 50  0001 C CNN
F 3 "" H 5650 4850 50  0001 C CNN
	1    5650 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 5250 3150 5250
Text Label 3150 5250 0    50   ~ 0
MOSI0
Wire Wire Line
	3400 5350 3150 5350
Text Label 3150 5350 0    50   ~ 0
MISO0
Wire Wire Line
	3150 5450 3400 5450
Text Label 3150 5450 0    50   ~ 0
SCK0
Wire Wire Line
	4100 4850 4300 4850
Wire Wire Line
	4100 5350 4400 5350
Wire Wire Line
	4400 5350 4500 5350
Connection ~ 4400 5350
Wire Wire Line
	4800 5350 4900 5350
Wire Wire Line
	4900 5350 4900 4950
Wire Wire Line
	3400 4850 3300 4850
Wire Wire Line
	7300 3800 7450 3800
Wire Wire Line
	7450 3800 7450 4100
Wire Wire Line
	7450 4100 7300 4100
Wire Wire Line
	7450 4100 7450 4700
Connection ~ 7450 4100
Wire Wire Line
	7300 4000 7900 4000
Wire Wire Line
	7300 3900 8700 3900
Wire Wire Line
	7450 4700 7900 4700
Wire Wire Line
	7900 4000 7900 4100
Wire Wire Line
	7900 4600 7900 4700
Wire Wire Line
	8950 3900 8950 4100
Wire Wire Line
	8950 4600 8950 4700
$Comp
L power:+3.3V #PWR022
U 1 1 6156A77C
P 8700 3900
F 0 "#PWR022" H 8700 3750 50  0001 C CNN
F 1 "+3.3V" H 8715 4073 50  0000 C CNN
F 2 "" H 8700 3900 50  0001 C CNN
F 3 "" H 8700 3900 50  0001 C CNN
	1    8700 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR023
U 1 1 6156ACE6
P 8950 4700
F 0 "#PWR023" H 8950 4450 50  0001 C CNN
F 1 "GND" H 8955 4527 50  0000 C CNN
F 2 "" H 8950 4700 50  0001 C CNN
F 3 "" H 8950 4700 50  0001 C CNN
	1    8950 4700
	1    0    0    -1  
$EndComp
Connection ~ 8950 4700
Wire Wire Line
	3300 4400 3100 4400
Wire Wire Line
	3300 4400 3300 4850
Wire Wire Line
	4300 4300 3100 4300
Wire Wire Line
	4300 4300 4300 4850
Wire Wire Line
	4400 4200 3100 4200
Wire Wire Line
	4400 4200 4400 5350
Wire Wire Line
	5700 4100 4800 4100
Wire Wire Line
	4800 4000 4800 4100
Connection ~ 4800 4100
Wire Wire Line
	4800 4100 3100 4100
$Comp
L power:+3.3V #PWR019
U 1 1 615798A4
P 4800 3700
F 0 "#PWR019" H 4800 3550 50  0001 C CNN
F 1 "+3.3V" H 4815 3873 50  0000 C CNN
F 2 "" H 4800 3700 50  0001 C CNN
F 3 "" H 4800 3700 50  0001 C CNN
	1    4800 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 3900 5450 3900
Text Label 5450 3900 0    50   ~ 0
MOSI0
Wire Wire Line
	5700 4000 5450 4000
Wire Wire Line
	5450 3800 5700 3800
Text Label 5450 3800 0    50   ~ 0
SCK0
$Comp
L Device:R R?
U 1 1 60789144
P 4600 4850
AR Path="/60789144" Ref="R?"  Part="1" 
AR Path="/614D955F/60789144" Ref="R11"  Part="1" 
F 0 "R11" V 4393 4850 50  0000 C CNN
F 1 "10kΩ" V 4484 4850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4530 4850 50  0001 C CNN
F 3 "~" H 4600 4850 50  0001 C CNN
	1    4600 4850
	0    1    1    0   
$EndComp
Connection ~ 4300 4850
Wire Wire Line
	5350 4850 5350 5050
Connection ~ 5350 5050
Wire Wire Line
	4750 4850 5350 4850
Wire Wire Line
	4300 4850 4450 4850
Wire Wire Line
	4100 5050 5350 5050
Wire Wire Line
	4900 4950 5650 4950
Connection ~ 4900 4950
Wire Wire Line
	5350 5050 5350 5450
$Comp
L power:GND #PWR021
U 1 1 61559F5D
P 5650 5550
F 0 "#PWR021" H 5650 5300 50  0001 C CNN
F 1 "GND" H 5655 5377 50  0000 C CNN
F 2 "" H 5650 5550 50  0001 C CNN
F 3 "" H 5650 5550 50  0001 C CNN
	1    5650 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 5450 5650 5550
Wire Wire Line
	5350 5450 5650 5450
Connection ~ 5650 5450
Connection ~ 5650 4950
$Comp
L pspice:C C?
U 1 1 61509FFB
P 5650 5200
AR Path="/61509FFB" Ref="C?"  Part="1" 
AR Path="/614D955F/61509FFB" Ref="C5"  Part="1" 
F 0 "C5" H 5828 5246 50  0000 L CNN
F 1 "0.1uF" H 5828 5155 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 5650 5200 50  0001 C CNN
F 3 "~" H 5650 5200 50  0001 C CNN
	1    5650 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 3900 8950 3900
Connection ~ 8700 3900
Wire Wire Line
	7900 4700 8950 4700
Connection ~ 7900 4700
Text Label 5450 4000 0    50   ~ 0
MISO0
Text HLabel 3100 4500 0    50   Input ~ 0
RST_ADIS16470
Wire Wire Line
	3100 4500 4200 4500
Wire Wire Line
	4200 4500 4200 5450
Wire Wire Line
	4200 5450 4100 5450
Wire Wire Line
	3400 4950 3400 5050
Connection ~ 3400 4950
$Comp
L power:+3.3V #PWR018
U 1 1 60920467
P 2600 4850
F 0 "#PWR018" H 2600 4700 50  0001 C CNN
F 1 "+3.3V" H 2615 5023 50  0000 C CNN
F 2 "" H 2600 4850 50  0001 C CNN
F 3 "" H 2600 4850 50  0001 C CNN
	1    2600 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 60920820
P 3000 5250
F 0 "#PWR017" H 3000 5000 50  0001 C CNN
F 1 "GND" H 3005 5077 50  0000 C CNN
F 2 "" H 3000 5250 50  0001 C CNN
F 3 "" H 3000 5250 50  0001 C CNN
	1    3000 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 5150 4100 5050
Connection ~ 4100 5050
$Comp
L Device:R R?
U 1 1 608F4221
P 4650 5450
AR Path="/608F4221" Ref="R?"  Part="1" 
AR Path="/614D955F/608F4221" Ref="R21"  Part="1" 
F 0 "R21" V 4850 5450 50  0000 C CNN
F 1 "10kΩ" V 4750 5450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4580 5450 50  0001 C CNN
F 3 "~" H 4650 5450 50  0001 C CNN
	1    4650 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	4200 5450 4500 5450
Connection ~ 4200 5450
Wire Wire Line
	4800 5450 4900 5450
Wire Wire Line
	4900 5450 4900 5350
Connection ~ 4900 5350
Wire Wire Line
	2600 4950 2600 4850
Wire Wire Line
	2600 4950 3400 4950
$Comp
L Device:R R?
U 1 1 608F845D
P 3150 4850
AR Path="/608F845D" Ref="R?"  Part="1" 
AR Path="/614D955F/608F845D" Ref="R20"  Part="1" 
F 0 "R20" V 2943 4850 50  0000 C CNN
F 1 "10kΩ" V 3034 4850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3080 4850 50  0001 C CNN
F 3 "~" H 3150 4850 50  0001 C CNN
	1    3150 4850
	0    1    1    0   
$EndComp
Connection ~ 3300 4850
Wire Wire Line
	3000 5150 3000 5250
Wire Wire Line
	3000 5150 3400 5150
Wire Wire Line
	3000 4850 3000 5150
Connection ~ 3000 5150
$EndSCHEMATC
