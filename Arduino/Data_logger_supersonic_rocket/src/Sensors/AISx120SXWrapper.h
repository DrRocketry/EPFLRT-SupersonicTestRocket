/*
 * AISx120SXWrapper.h
 *
 *  Created on: 2021-04-26
 *      Author: Joshua Cayetano-Emond
 */

#pragma once

// Standard libraries
#include <Arduino.h>

// External libraries
#include <AISx120SX.h>

// User-defined headers
#include "Sensor.h"

struct AISx120SXPacket
{
  struct PacketHeader header; // 8 bytes
  uint16_t accelX;            // 2 bytes
  // following unused for the AIS1120SX but necessary for alignment
  uint16_t accelY; // 2 bytes

  // overloaded constructor
  AISx120SXPacket(PacketHeader header_, int16_t acceleration[2])
  {
    header = header_;
    accelX = acceleration[0];
    accelY = acceleration[1];
  }
};

// Wrapper for the AISx120SX class
class AISx120SXWrapper : public Sensor
{
private:
  static const uint32_t MEASUREMENT_INTERVAL = 2500; // [us] (400 Hz)
  static const uint32_t CHECK_INTERVAL =
      MEASUREMENT_INTERVAL / 10;                // [us]
  static const uint32_t MEASUREMENT_MARGIN = 0; // [us]

  int16_t prevMeas[2]; // previous measurement from the sensor

  AISx120SX aisObject;
  static uint8_t sensorQty; // how many sensors of this type exist

public:
  // constructor
  AISx120SXWrapper(uint8_t CS_);

  // destructor
  ~AISx120SXWrapper();

  // attemps to set up the sensor and returns true if it was successful
  bool setup(int attempts, int delayDuration);

  // return the current count of sensors
  uint8_t getSensorQty();

  // check if the sensor is due for a measurement
  bool isDue(uint32_t currMicros);

  AISx120SXPacket getPacket(uint32_t currMicros);
};