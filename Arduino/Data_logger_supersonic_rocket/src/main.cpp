/*
 * main.cpp Main file that will be used to log data on the Teensy.
 *
 *  Created on: 2021-04-21
 *      Author: Joshua Cayetano-Emond
 */

// HEADER ======================================================================
// DATA_LOGGER Script v0.1
// Author: Joshua Cayetano-Emond
// Email: newbie856@gmail.com
// Last updated: 2021-04-21
//
// Changelog:
// v0.1 : first version of the script

// IMPORT LIBRARIES ============================================================
// Standard libraries
#include <Arduino.h>
#include <SPI.h>

// External libraries
#include <ADIS16470.h>
#include <AISx120SX.h>
#include <Honeywell_RSC.h>
#include <MAX31855.h>

// User-defined headers
#include "globalVariables.h"
#include "PushButtonArray/PushButtonArray.h"
#include "dataAcquisition.h"
#include "io.h"

// DEFINE VARIABLES ============================================================

// Pins ------------------------------------------------------------------------
// I/O
const uint8_t GREEN_LED_PIN = 7,
              RED_LED_PIN = 8,
              BUTTON0_PIN = 2,
              BUTTON1_PIN = 6;
// ADIS164760
const uint8_t DR_ADIS16470_PIN = 24,
              SYNC_ADIS16470_PIN = 25,
              RST_ADIS16470_PIN = 35,
              CS_ADIS16470_PIN = 36;
// AIS1120SX
const uint8_t CS_AIS1120SX_PIN = 31;
// Pressure sensors
const uint8_t CS_RSC015_EE_PIN = 17,
              CS_RSC015_ADC_PIN = 16,
              DR_RSC015 = 15;
const uint8_t CS_RSC060_EE_PIN = 28,
              CS_RSC060_ADC_PIN = 27,
              DR_RSC060 = 26;
// Thermocouples
const uint8_t CS_TCS_PIN[4] = {23, 22, 21, 20};

// I/O -------------------------------------------------------------------------
// Button event
const int ACQ_STATE = 1;                     // State to turn on acquisition
const int ACQ_NEXT_STATE = 0;                // Next state to turn on
const uint32_t ACQ_WINDOW_START = 1000; // [ms]
const uint32_t ACQ_WINDOW_END = 2000;   // [ms]

// Create the sensor objects ---------------------------------------------------
ADIS16470 adis16470(CS_ADIS16470_PIN, DR_ADIS16470_PIN, RST_ADIS16470_PIN);
AISx120SX ais1120sx(CS_AIS1120SX_PIN);
Honeywell_RSC rsc015(DR_RSC015, CS_RSC015_EE_PIN, CS_RSC015_ADC_PIN);
Honeywell_RSC rsc060(DR_RSC060, CS_RSC060_EE_PIN, CS_RSC060_ADC_PIN);
MAX31855_Class tcs[4];

const int sensorAttempts = 3; // How many times to try to turn on the sensors

// USER FUNCTIONS ==============================================================

// SETUP =======================================================================

void setup()
{
  // Open serial communications and give some time for the port to open
  // Not waiting on the port in case the device is not connected to USB
  Serial.begin(9600);
  delay(2500);

  // Set up I/O
  pinMode(GREEN_LED_PIN, OUTPUT);
  pinMode(RED_LED_PIN, OUTPUT);
  pinMode(BUTTON0_PIN, INPUT);
  pinMode(BUTTON1_PIN, INPUT);
  digitalWrite(GREEN_LED_PIN, LOW); // turn off LED in case
  digitalWrite(RED_LED_PIN, LOW); // turn off LED in case
  Serial.println("I/O has been set up");
  successFlash(); // visual feedback setup is happening

  SPI.begin();

  // Set up the ADIS16470
  adis16470.regWrite(MSC_CTRL, 0xC1);  // Enable Data Ready, set polarity
  adis16470.regWrite(DEC_RATE, 0x00);  // Set digital filter
  adis16470.regWrite(FILT_CTRL, 0x04); // Set digital filter
  // Try to see if the ADIS is working
  for (int i = 0; i < sensorAttempts; i++)
  {
    // acquire some data
    uint16_t *wordBurstData;
    wordBurstData = adis16470.wordBurst();                // Read data and insert into array
    int16_t checksum = adis16470.checksum(wordBurstData); // get the checksum

    // get a zero vector to make sure the data we are getting isn't just zeros
    uint16_t zeros[sizeof(wordBurstData)] = {0};

    // checksum ok AND didn't read just zeros --> setup successful!
    if (wordBurstData[9] == checksum &&
        memcmp(wordBurstData, zeros, sizeof(wordBurstData)) != 0)
    {
      Serial.println("ADIS16470 has been set up properly.");
      successFlash();
      break;
    }
    else if (i == sensorAttempts - 1)
    {
      Serial.println("Unable to start ADIS16470.");
      errorFlash();
    }
    else // give it time before the next try
    {
      delay(1000);
    }
  }

  // Set up the AIS1120SX
  Serial.println("AIS1120SX has been set up");
  successFlash(); // visual feedback setup is happening

  // Set up the pressure sensors
  rsc015.init();
  rsc060.init();
  Serial.println("Pressure sensors have been set up");
  successFlash(); // visual feedback setup is happening

  // Set up the thermocouples
  for (int i = 0; i < 4; i++)
  {
    // Try to see if the thermocouple is working
    for (int j = 0; j < sensorAttempts; j++)
    {
      if (tcs[i].begin(CS_TCS_PIN[i]))
      {
        Serial.println("Thermocouple has been set up properly.");
        successFlash();
        break;
      }
      else if (j == sensorAttempts - 1)
      {
        Serial.print("Unable to start thermocouple TC");
        Serial.println(i + 1);
        errorFlash();
      }
      else // give it time before the next try
      {
        delay(1000);
      }
    }
  }

  Serial.println("Setup complete.");
  successFlash();
}

// LOOP ========================================================================

void loop()
{
  // create the button array
  PushButtonArray buttonArray = PushButtonArray();
  // setup the event
  uint8_t logStartEvent = buttonArray.addEvent(
      ACQ_STATE, ACQ_NEXT_STATE, ACQ_WINDOW_START, ACQ_WINDOW_END);
  // setup the output from the event check
  eventOutput eventCheck;

  // repeatedly check if button has been pressed for data acquistion
  while (true)
  {
    bool indivButtonState[2];
    indivButtonState[0] = digitalRead(BUTTON0_PIN);
    indivButtonState[1] = digitalRead(BUTTON1_PIN);
    eventCheck = buttonArray.checkEvents(indivButtonState);

    // if any of the events happened, do something
    if (eventCheck.triggeredEvent == logStartEvent)
    {
      switch (eventCheck.triggeredEventType)
      {
      case NONE:
        break;
      case GOOD_TRANSITION:
        Serial.println("Will begin data acquisition as button was pressed.");
        digitalWrite(GREEN_LED_PIN, LOW);
        acquireData(adis16470, ais1120sx, rsc015, rsc060, tcs);
        break;
      case BAD_TRANSITION:
        Serial.println("Button not pressed properly. Not doing anything.");
        digitalWrite(GREEN_LED_PIN, LOW);
        break;
      case WINDOW_START:
        Serial.println("Within window to start data acquisition.");
        digitalWrite(GREEN_LED_PIN, HIGH);
        break;
      case WINDOW_END:
        Serial.println("Left window to start data acquisition.");
        digitalWrite(GREEN_LED_PIN, LOW);
        break;
      }
    }

    delay(50);
  }
}