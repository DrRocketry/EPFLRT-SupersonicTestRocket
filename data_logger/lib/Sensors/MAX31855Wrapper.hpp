/*
 * MAX31855Wrapper.h
 *
 *  Created on: 2021-04-26
 *      Author: Joshua Cayetano-Emond
 */

#pragma once

// Standard libraries
#include <Arduino.h>

// External libraries
#include <MAX31855.h>

// User-defined headers
#include "Sensor.hpp"
#include "Packet.hpp"
#include "macrofunctions.h"

// *************** MAX31855Packet *************** //

/// Describe the content of a MAX31855 packet
struct MAX31855Body
{
  float probeTemperature = 0;  ///< 4 bytes
  float sensorTemperature = 0; ///< 4 bytes
};

#define MAX31855_BODY_FORMAT "**************** MAX31855 Packet ***************\n" \
                             "Probe temperature: %12e\n"                          \
                             "Sensor temperature: %12e\n"                         \
                             "***************** END OF PACKET ****************\n"

/**
 * @brief MAX31855_BODY_FORMAT has 4 lines,
 *        with the opening and closing ones being 50 chars long
 *        (null char included)
 */
#define MAX31855_BODY_PRINT_SIZE 50 * 4

/**
 * @brief Packets generated by MAX31855 sensors
 *
 */
class MAX31855Packet : public Packet
{
public:
  // ----- Constructors ----- //

  /**
   * @brief Construct a new MAX31855Packet based on the default header
   *
   * \c packetType_ and \c packetSize are accordingly set.
   * Packet::content is allocated.
   *
   * @see Packet::Packet()
   */
  MAX31855Packet()
  {
    header.packetType_ = MAX31855_PACKET_TYPE;
    header.packetSize = sizeof(MAX31855Body);

    content = malloc(header.packetSize);
  }

  /**
   * @brief Construct a new MAX31855Packet from a given header
   *
   * Set the header to the one provided and allocate memory according the the size
   * indicated in the header
   *
   * @param h Header for the packet, must have correct size and type
   */
  MAX31855Packet(PacketHeader h)
  {
    assert(h.packetType_ == MAX31855_PACKET_TYPE &&
           h.packetSize == sizeof(MAX31855Body));

    header = h;
    content = malloc(h.packetSize);
  }

  // ----- Getters ----- //
  /**
   * @brief Get the probe temperature
   *
   * @return float
   */
  float getProbeTemperature()
  {
    return reinterpret_cast<MAX31855Body *>(content)->probeTemperature;
  }

  /**
   * @brief Get the sensor temperature
   *
   * @return float
   */
  float getSensorTemperature()
  {
    return reinterpret_cast<MAX31855Body *>(content)->sensorTemperature;
  }

  /**
   * @brief Return a pointer toward a printable description of an AISx120SX content
   *
   * @return char* : Pointer toward formated content description
   */
  char *getPrintableContent()
  {
    char output[MAX31855_BODY_PRINT_SIZE] = "";

    snprintf(output, MAX31855_BODY_PRINT_SIZE, MAX31855_BODY_FORMAT,
             getProbeTemperature(),
             getSensorTemperature());

    return output;
  }

  // ----- Setters ----- //
  /**
   * @brief Set the probe temperature
   *
   * @param t Provided value
   */
  void setProbeTemperature(float t)
  {
    reinterpret_cast<MAX31855Body *>(content)->probeTemperature = t;
  }

  /**
   * @brief Set the sensor temperature
   *
   * @param t Provided value
   */
  void setSensorTemperature(float t)
  {
    reinterpret_cast<MAX31855Body *>(content)->sensorTemperature = t;
  }

  /**
   * @brief Set the whole content of the packet
   *
   * @param b
   */
  void setContent(MAX31855Body b)
  {
    memcpy(content, static_cast<void *>(&b), sizeof(MAX31855Body));
  }
};

// *************** MAX31855Wrapper *************** //

/**
 * @brief Wrapper for MAX31855 sensors
 *
 */
class MAX31855Wrapper : public Sensor
{
private:
  static const uint32_t MEASUREMENT_INTERVAL = 70 * 1000;           ///< [us] (70 ms)
  static const uint32_t CHECK_INTERVAL = MEASUREMENT_INTERVAL / 10; ///< [us] (2000Hz)
  static const uint32_t MEASUREMENT_MARGIN = 0;                     ///< [us]

  // sensor properties for error checking and conversions
  static constexpr float PROBE_SENSITIVITY = 0.25 / 4.;      ///< [degC/LSB]
  static constexpr float PROBE_MAX = 1372;                   ///< [degC]
  static constexpr float PROBE_MIN = -270;                   ///< [degC]
  static constexpr float AMBIENT_SENSITIVITY = 0.0625 / 16.; ///< [degC/LSB]
  static constexpr float AMBIENT_MAX = 125;                  ///< [degC]
  static constexpr float AMBIENT_MIN = -55;                  ///< [degCÒ]

  MAX31855_Class max31855Object; ///< Underlying object
  static uint8_t sensorQty;      ///< How many sensors of this type exist

    MAX31855Packet lastPacket; ///< Holder for the packet, actualized by measurements

  // Setup parameter
  uint8_t CS; ///< For setup, index for CS pin

public:
  /**
   * @brief Construct a new MAX31855Wrapper object
   *
   * Initialize MAX31855Wrapper::lastPacket
   * Also call Sensor::setupProperties with the preset values for Sensor::MEASUREMENT_INTERVAL,
   * Sensor::CHECK_INTERVAL and Sensor::MEASUREMENT_MARGIN
   * This sensor does not have a DR pin.
   *
   * @param CS Index for CS pin
   */
  MAX31855Wrapper(uint8_t CS);

  /// Destructor; reduce MAX31855Wrapper::sensorQty
  ~MAX31855Wrapper();

  /**
   * @brief Implementation of setup for MAX31855Wrapper
   *
   * A setup is successful if the underlying object returns that setup was successful
   *
   * @param attempts Number of allowed attempts to try setting up the sensor
   * @param delayDuration Delay between the tries
   * @return true : The Sensor is correctly set up
   * @return false : The Sensor failed to set up
   */
  bool setup(uint32_t attempts, uint32_t delayDuration);

  /**
   * @brief Get the name of this sensor as a string
   *
   * @return const char* : \c MAX31855
   */
  const char *myName() { return "MAX31855"; }

  /**
   * @brief Get the number of MAX31855Wrapper objects
   *
   * It should be equal to the number of MAX31855 sensors installed
   *
   * @return uint8_t : Number of MAX31855Wrapper
   */
  uint8_t getSensorQty();

  /**
   * @brief Check if the MAX31855 is due for a measurement
   *
   * A measurement is due if it is by time and the underlying object does not declare any error.
   * Update Sensor::prevMeasTime
   *
   * @param currMicros Current time, in microseconds
   * @param triggeredDR [UNUSED] Status of the DR line
   *
   * @return true : A measurement is due
   * @return false : No measurement due
   */
  bool isDue(uint32_t currMicros, unused(volatile bool &triggeredDR));

  /**
   * @brief Check if the current MAX31855Wrapper::lastPacket is invalid
   *
   * A packet is invalid if one of the values is outside its range.
   *
   * @return true : MAX31855Wrapper::lastPacket is invalid
   * @return false : MAX31855Wrapper::lastPacket is valid
   */
  bool isMeasurementInvalid();

  /**
   * @brief Generate a reference to MAX31855Wrapper::lastPacket after updating its header
   *
   * @param currMicros Current time, in microseconds
   * @return MAX31855Wrapper* : Reference to the updated MAX31855Wrapper::lastPacket
   */
  MAX31855Packet *getPacket(uint32_t currMicros);

  /**
   * @brief Wrapper to generate MAX31855's packet header
   *
   * Call Sensor::getHeader with correct arguments
   *
   * @param currMicros Current time, in microseconds
   * @return PacketHeader for MAX31855
   */
  PacketHeader getHeader(uint32_t currMicros);
};