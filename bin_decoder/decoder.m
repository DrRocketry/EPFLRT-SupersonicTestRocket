% decoder.m Decodes binary files from the supersonic rocket into CSV
%
%   Author: Joshua Cayetano-Emond
%   Creation date: 2021-04-23
%
%
clear all; clc; close all;

%% Variables ==============================================================
% file directories
inDir = './inFiles';
outDir = './outFiles';
processedDir = './processedFiles';
errorDir = './errorFiles';

% headers
error_header = 'measSkippedBeat, skippedBeat, drNoTrigger, checksumError';
IMU_header = 'timestep (us), gyroX, gyroY, gyroZ, accelX, accelY, accelZ, temp';
RSC_header = 'timestep (us), gyroX, gyroY, gyroZ, accelX, accelY, accelZ, temp';
AIS_header = 'timestep (us), accelX, accelY';
temp_header = 'timestep (us), gyroX, gyroY, gyroZ, accelX, accelY, accelZ, temp';

%% Code ===================================================================

inFiles = dir(fullfile(inDir,'*.dat')); %gets all wav files in struct
for k = 1:length(inFiles)
  fileName = inFiles(k).name;
  fileNameNoExtension = fileName(1:end-4);
  fullFileName = fullfile(inDir, fileName);

  fprintf(1, 'Now reading %s\n', fileName);
  
  % create the output directory
  outputDir = fullfile(outDir, fileNameNoExtension);
  mkdir(outputDir);
  
  % create the output files and write the headers
  
  IMUfile = fopen(fullfile(outputDir,'/IMU.csv'),'w');
  fprintf(IMUfile, '%s, %s\n', error_header, IMU_header);
  RSCfile = fopen(fullfile(outputDir,'/RSC.csv'),'w');
  fprintf(RSCfile, '%s, %s\n', error_header, RSC_header);
  AISfile = fopen(fullfile(outputDir,'/AIS.csv'),'w');
  fprintf(AISfile, '%s, %s\n', error_header, AIS_header);
  
  % open the Tempfiles
  for i = 1:4
    Tempfile(i) = fopen(fullfile(outputDir, ...
        sprintf('/Temp%i.csv',i)),'w');
    fprintf(Tempfile(i), '%s, %s\n', error_header, temp_header);
  end
  
  % write the headers to the output files
  
  % open the input file
  inFile = fopen(fullFileName,'r');
  
  while true
    packetType = fread(inFile, 1, 'uint8');
    packetLength = fread(inFile, 1, 'uint8');
    
    
    if (~isscalar(packetType) || ~isscalar(packetLength))
        fprintf('Reached EOF.\n');
        fclose('all');
        movefile(fullFileName, fullfile(processedDir, fileName));
        break;
    elseif (packetType == 1 && packetLength == 24) % IMU packet
        sensorId = decodeErrorByte(fread(inFile, 1, 'uint8'));
        errorMessage = decodeErrorByte(fread(inFile, 1, 'uint8'));
        timestep = fread(inFile, 1, 'uint32');
        gyroX = fread(inFile, 1, 'uint16');
        gyroY = fread(inFile, 1, 'uint16');
        gyroZ = fread(inFile, 1, 'uint16');
        accelX = fread(inFile, 1, 'uint16');
        accelY = fread(inFile, 1, 'uint16');
        accelZ = fread(inFile, 1, 'uint16');
        temp = fread(inFile, 1, 'uint16', 2);
        fprintf(IMUfile, '%s, %d, %i, %i, %i, %i, %i, %i, %i\n', ...
            errorMessage, timestep, gyroX, gyroY, gyroZ, accelX, ...
            accelY, accelZ, temp);
    elseif (packetType == 2 && packetLength == 12) % AIS packet
        sensorId = decodeErrorByte(fread(inFile, 1, 'uint8'));
        errorMessage = decodeErrorByte(fread(inFile, 1, 'uint8'));
        timestep = fread(inFile, 1, 'uint32');
        accelX = fread(inFile, 1, 'uint16');
        accelY = fread(inFile, 1, 'uint16');
        fprintf(AISfile, '%s, %d, %i, %i\n', errorMessage, timestep, ...
            accelX, accelY);
    elseif (packetType == 3 && packetLength == 12) % RSC presure packet
    elseif (packetType == 4 && packetLength == 12) % RSC temp packet
    elseif (packetType == 5 && packetLength == 12) % temp packet
        sensorId = decodeErrorByte(fread(inFile, 1, 'uint8'));
        errorMessage = decodeErrorByte(fread(inFile, 1, 'uint8'));
        timestep = fread(inFile, 1, 'uint32');
        rawProbeT = fread(inFile, 1, 'int16');
        rawAmbientT = fread(inFile, 1, 'int16');
        fprintf(Tempfile(sensorId), '%s, %d, %i, %i\n', ...
            errorMessage, timestep, rawProbeT, rawAmbientT);
    else
        fprintf('ERROR. Could not determine packet type. Stopping early.\n');
        fprintf('This was likely caused by logging stopped prematurely (i.e power loss or SD card disconnected).\n');
        fclose('all');
        movefile(fullFileName, fullfile(errorDir, fileName));
        break;
    end
    
    
  end
end