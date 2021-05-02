# SupersonicTestRocket
Repository for the avionics going on the supersonic test rocket.
This contains the various files and folders required to get a Teensy 3.5 working with the code for data acquisition as well as the necessary post-processing scripts.


# Usage
1.  Flash the firmware onto the Teensy 3.5.  
  a. If no modifications are required to the code, this can be done by taking the file ```firmware.hex``` and flashing it directly with the Teensy flasher.  
  b. If modifications are required, Platform.io will need to be installed on the local computer on VSCode. Instructions can be found [here](https://platformio.org/platformio-ide). The required modifications can then be made and ```main.cpp``` can be recompiled using the IDE.
2.  Log data on the Teensy 3.5.  
  a. Logging should start automatically when powered on.
  b. If it is not, press and hold button 1 for 1 second. The green LED (LED1 on the PCB) should then light up for 1 second. If the button is released during this window, logging should start indicated by the green LED staying on continuously.
3.  Stop logging on the Teensy 3.5 (optional but highly recommended!).  
  a. Logging needs to be stopped in the software using the following button sequence:
  b. Hold button 1 for 3 seconds. The green LED should turn off and the red LED should turn on for 1 second.  
  c. Let go of all buttons for 5 seconds. After this, the red LED should turn on again for 1 second.  
  d. Hold button 2 for 7 seconds. After this, the red LED should turn on again for 1 second. Let go of the button.  
  e. Logging should now stop, indicated by no LEDs turned on. Logging can be resumed again following the instructions from step 2.  
  f. If logging is not manually stopped, there could be filesystem corruption with a power loss to the Teensy.
4.  Put the Teensy in MTP mode to transfer data to a local computer.  
  a. Flash ```mtp.ino``` onto the Teensy 3.5 using the Arduino IDE.  
  b. The SD card should appear on the computer as a normal device. transfer the most recent files.
5.  Decode the binary files using the MATLAB binary decoder.  
  a. Put the recently acquired files in the ```inFiles``` folder of the MATLAB decoder.  
  b. run the decoder ```decoder.m``` using MATLAB.  
  c. The files should now be in ```outFiles```.
6.  Run the Kalman filter on the files (not yet implemented!).  
  a. Transfer the contents of ```outFiles``` to the relevant folder of the Kalman filter.  
  b. Run the Kalman filter.  

# Contents
```
SupersonicTestRocket
|   README.md
|
│───archives            archived code
│───bin_decoder         MATLAB binary decoder for raw output files
|   |   decoder.m       the decoder itself
|   |
|   |───errorFiles      input files that had errors during processing
|   |───inFiles         input files to process by the decoder
|   |───outFiles        .csv files generated by the decoder
|   └───processedFiles  input files after successful processing
|
│───data_logger_supersonic_rocket   logger to put on the Teensy 3.5
|   |───.pio
|   |   └───build
|   |        └───teensy35
|   |           |   firmware.hex    the firmware to flash on the Teensy 3.5
|   |
|   └───src
│       │   main.cpp    the file that should be compiled with Platform.io
|
│───datasheets          datasheets for the sensors used on the rocket
│───KF                  MATLAB Kalman filter to process flight data
|   └───2D              2D simulations of the flight and KF testing
|   └───3D              the full 3D Kalman filter for flight data
|
|───mtp                 
|   └───mtp.ino         the code to run with the Arduino IDE to access the SD
|
└───PCB                 the Kicad files to reproduce the PCB
└───readings            interesting readings relevant to the project

```

# Collaborators
Joshua Cayetano-Emond
