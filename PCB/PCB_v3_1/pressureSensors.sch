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
L Device:R R?
U 1 1 614D8E18
P 8850 2900
AR Path="/614D8E18" Ref="R?"  Part="1" 
AR Path="/614D2ECF/614D8E18" Ref="R19"  Part="1" 
F 0 "R19" V 9057 2900 50  0000 C CNN
F 1 "10kΩ" V 8966 2900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8780 2900 50  0001 C CNN
F 3 "~" H 8850 2900 50  0001 C CNN
	1    8850 2900
	0    -1   -1   0   
$EndComp
$Comp
L custom_lib:RSCDJNI060PASE3 U?
U 1 1 614D8E1E
P 6950 2550
AR Path="/614D8E1E" Ref="U?"  Part="1" 
AR Path="/614D2ECF/614D8E1E" Ref="U12"  Part="1" 
F 0 "U12" H 7150 2525 50  0000 C CNN
F 1 "RSCDJNI060PASE3" H 7150 2434 50  0000 C CNN
F 2 "CustomLib:DIP-8_W13.08mm" H 6950 2550 50  0001 C CNN
F 3 "" H 6950 2550 50  0001 C CNN
	1    6950 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 615075C7
P 5900 3100
AR Path="/615075C7" Ref="R?"  Part="1" 
AR Path="/614D2ECF/615075C7" Ref="R18"  Part="1" 
F 0 "R18" V 5693 3100 50  0000 C CNN
F 1 "10kΩ" V 5784 3100 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5830 3100 50  0001 C CNN
F 3 "~" H 5900 3100 50  0001 C CNN
	1    5900 3100
	0    1    1    0   
$EndComp
$Comp
L pspice:C C10
U 1 1 6150839B
P 8550 3250
F 0 "C10" H 8728 3296 50  0000 L CNN
F 1 "100nF" H 8728 3205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8550 3250 50  0001 C CNN
F 3 "~" H 8550 3250 50  0001 C CNN
	1    8550 3250
	1    0    0    -1  
$EndComp
$Comp
L pspice:C C11
U 1 1 6150873F
P 9150 3250
F 0 "C11" H 9328 3296 50  0000 L CNN
F 1 "10uF" H 9328 3205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9150 3250 50  0001 C CNN
F 3 "~" H 9150 3250 50  0001 C CNN
	1    9150 3250
	1    0    0    -1  
$EndComp
Text HLabel 9200 3950 2    50   Input ~ 0
MOSI0
Text HLabel 9200 4150 2    50   Input ~ 0
SCK0
Text HLabel 9200 4050 2    50   Input ~ 0
MISO0
Wire Wire Line
	5750 2900 5500 2900
Text HLabel 9200 4350 2    50   Input ~ 0
CS_RSC060_ADC
Text HLabel 9200 4250 2    50   Input ~ 0
CS_RSC060_EE
Text HLabel 9200 4450 2    50   Input ~ 0
DR_RSC060
Wire Wire Line
	6250 2900 6250 4450
Wire Wire Line
	7600 3000 8550 3000
Connection ~ 8550 3000
Wire Wire Line
	8550 3000 9150 3000
Wire Wire Line
	7600 3100 8300 3100
Wire Wire Line
	8300 3100 8300 3500
Wire Wire Line
	8300 3500 8550 3500
Connection ~ 8550 3500
Wire Wire Line
	8550 3500 9150 3500
Wire Wire Line
	9150 3500 9600 3500
Wire Wire Line
	9600 3500 9600 3600
Connection ~ 9150 3500
$Comp
L power:GND #PWR028
U 1 1 6152536F
P 9600 3600
F 0 "#PWR028" H 9600 3350 50  0001 C CNN
F 1 "GND" H 9605 3427 50  0000 C CNN
F 2 "" H 9600 3600 50  0001 C CNN
F 3 "" H 9600 3600 50  0001 C CNN
	1    9600 3600
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR027
U 1 1 61525659
P 9600 2900
F 0 "#PWR027" H 9600 2750 50  0001 C CNN
F 1 "+3.3V" H 9615 3073 50  0000 C CNN
F 2 "" H 9600 2900 50  0001 C CNN
F 3 "" H 9600 2900 50  0001 C CNN
	1    9600 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 3000 9600 3000
Connection ~ 9150 3000
Wire Wire Line
	7600 2900 7700 2900
Wire Wire Line
	9600 3000 9600 2900
Connection ~ 9600 2900
Wire Wire Line
	9000 2900 9600 2900
Wire Wire Line
	9200 4250 7700 4250
Connection ~ 7700 2900
Wire Wire Line
	7700 2900 8700 2900
Text Label 6450 2800 0    50   ~ 0
SCK0
Text Label 6450 3000 0    50   ~ 0
MOSI0
Wire Wire Line
	6250 2900 6700 2900
Wire Wire Line
	6450 3000 6700 3000
Wire Wire Line
	6450 2800 6700 2800
Text Label 7850 2800 2    50   ~ 0
MISO0
Wire Wire Line
	7600 2800 7850 2800
Connection ~ 6350 3100
Wire Wire Line
	6350 3100 6700 3100
Wire Wire Line
	6050 3100 6350 3100
Wire Wire Line
	6350 4350 9200 4350
Wire Wire Line
	7700 2900 7700 4250
Wire Wire Line
	6250 4450 9200 4450
Wire Wire Line
	6350 3100 6350 4350
$Comp
L custom_lib:RSCMRNE015PASE3 U11
U 1 1 60772882
P 2850 2550
F 0 "U11" H 3050 2525 50  0000 C CNN
F 1 "RSCMRNE015PASE3" H 3050 2434 50  0000 C CNN
F 2 "Package_DIP:SMDIP-8_W9.53mm" H 2850 2550 50  0001 C CNN
F 3 "" H 2850 2550 50  0001 C CNN
	1    2850 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60778756
P 4750 2900
AR Path="/60778756" Ref="R?"  Part="1" 
AR Path="/614D2ECF/60778756" Ref="R16"  Part="1" 
F 0 "R16" V 4957 2900 50  0000 C CNN
F 1 "10kΩ" V 4866 2900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4680 2900 50  0001 C CNN
F 3 "~" H 4750 2900 50  0001 C CNN
	1    4750 2900
	0    -1   -1   0   
$EndComp
$Comp
L pspice:C C8
U 1 1 6077875C
P 4450 3250
F 0 "C8" H 4628 3296 50  0000 L CNN
F 1 "100nF" H 4628 3205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4450 3250 50  0001 C CNN
F 3 "~" H 4450 3250 50  0001 C CNN
	1    4450 3250
	1    0    0    -1  
$EndComp
$Comp
L pspice:C C9
U 1 1 60778762
P 5050 3250
F 0 "C9" H 5228 3296 50  0000 L CNN
F 1 "10uF" H 5228 3205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5050 3250 50  0001 C CNN
F 3 "~" H 5050 3250 50  0001 C CNN
	1    5050 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 3000 4450 3000
Connection ~ 4450 3000
Wire Wire Line
	4450 3000 5050 3000
Wire Wire Line
	3500 3100 4200 3100
Wire Wire Line
	4200 3100 4200 3500
Wire Wire Line
	4200 3500 4450 3500
Connection ~ 4450 3500
Wire Wire Line
	4450 3500 5050 3500
Wire Wire Line
	5050 3500 5500 3500
Wire Wire Line
	5500 3500 5500 3600
Connection ~ 5050 3500
$Comp
L power:GND #PWR026
U 1 1 60778773
P 5500 3600
F 0 "#PWR026" H 5500 3350 50  0001 C CNN
F 1 "GND" H 5505 3427 50  0000 C CNN
F 2 "" H 5500 3600 50  0001 C CNN
F 3 "" H 5500 3600 50  0001 C CNN
	1    5500 3600
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR025
U 1 1 60778779
P 5500 2900
F 0 "#PWR025" H 5500 2750 50  0001 C CNN
F 1 "+3.3V" H 5515 3073 50  0000 C CNN
F 2 "" H 5500 2900 50  0001 C CNN
F 3 "" H 5500 2900 50  0001 C CNN
	1    5500 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3000 5500 3000
Connection ~ 5050 3000
Connection ~ 5500 2900
Wire Wire Line
	4900 2900 5500 2900
Text Label 3750 2800 2    50   ~ 0
MISO0
Wire Wire Line
	3500 2800 3750 2800
Text Label 2350 2800 0    50   ~ 0
SCK0
Text Label 2350 3000 0    50   ~ 0
MOSI0
Wire Wire Line
	2350 3000 2600 3000
Wire Wire Line
	2350 2800 2600 2800
Text HLabel 9200 4650 2    50   Input ~ 0
CS_RSC015_ADC
Text HLabel 9200 4550 2    50   Input ~ 0
CS_RSC015_EE
Text HLabel 9200 4750 2    50   Input ~ 0
DR_RSC015
$Comp
L Device:R R?
U 1 1 60785B9D
P 1800 3100
AR Path="/60785B9D" Ref="R?"  Part="1" 
AR Path="/614D2ECF/60785B9D" Ref="R15"  Part="1" 
F 0 "R15" V 1593 3100 50  0000 C CNN
F 1 "10kΩ" V 1684 3100 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1730 3100 50  0001 C CNN
F 3 "~" H 1800 3100 50  0001 C CNN
	1    1800 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	1650 3100 1400 3100
$Comp
L Device:R R?
U 1 1 607928B7
P 5900 2900
AR Path="/607928B7" Ref="R?"  Part="1" 
AR Path="/614D955F/607928B7" Ref="R?"  Part="1" 
AR Path="/614D2ECF/607928B7" Ref="R17"  Part="1" 
F 0 "R17" V 5693 2900 50  0000 C CNN
F 1 "10kΩ" V 5784 2900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5830 2900 50  0001 C CNN
F 3 "~" H 5900 2900 50  0001 C CNN
	1    5900 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	5750 3100 5500 3100
Wire Wire Line
	5500 3100 5500 3000
Wire Wire Line
	6050 2900 6250 2900
Connection ~ 6250 2900
$Comp
L power:+3.3V #PWR024
U 1 1 60798F94
P 1400 2900
F 0 "#PWR024" H 1400 2750 50  0001 C CNN
F 1 "+3.3V" H 1415 3073 50  0000 C CNN
F 2 "" H 1400 2900 50  0001 C CNN
F 3 "" H 1400 2900 50  0001 C CNN
	1    1400 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 2900 1400 2900
$Comp
L Device:R R?
U 1 1 60798F9B
P 1800 2900
AR Path="/60798F9B" Ref="R?"  Part="1" 
AR Path="/614D955F/60798F9B" Ref="R?"  Part="1" 
AR Path="/614D2ECF/60798F9B" Ref="R14"  Part="1" 
F 0 "R14" V 1593 2900 50  0000 C CNN
F 1 "10kΩ" V 1684 2900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1730 2900 50  0001 C CNN
F 3 "~" H 1800 2900 50  0001 C CNN
	1    1800 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	1400 3100 1400 2900
Connection ~ 1400 2900
Wire Wire Line
	5500 3000 5500 2900
Connection ~ 5500 3000
Wire Wire Line
	1950 3100 2250 3100
Wire Wire Line
	1950 2900 2150 2900
Wire Wire Line
	3500 2900 3600 2900
Connection ~ 2250 3100
Wire Wire Line
	2250 3100 2600 3100
Connection ~ 2150 2900
Wire Wire Line
	2150 2900 2600 2900
Wire Wire Line
	3600 2900 3600 4550
Wire Wire Line
	3600 4550 9200 4550
Connection ~ 3600 2900
Wire Wire Line
	3600 2900 4600 2900
Wire Wire Line
	2250 4650 9200 4650
Wire Wire Line
	2150 4750 9200 4750
Wire Wire Line
	2250 3100 2250 4650
Wire Wire Line
	2150 2900 2150 4750
$EndSCHEMATC
