close all
clear all
clc

minVal = 0.01;
maxVal = 0.1;

QValues = zeros(6 * 6, 4);

% YOUR CODE GOES HERE ....
QValues = minVal+(maxVal-minVal).*rand(36,4) %generate a 121 by 4 matrix of values between minVal and maxVal
Qmin = min(QValues) %These two are used to confirm the min and max values have been selected properly
Qmax = max(QValues)