close all
clear all
clc

samples = 10000;
theta = 0 + (pi-0).*rand(4,samples);
origin = [0, 0];
xA = [1,samples];
yA = [1,samples];
zA = [1,samples];

for i = 1:samples
    [x,y,z] = Forward_kinematics_test(i,theta);
    xA(1,i) = x;
    yA(1,i) = y;
    zA(1,i) = z;
end

plot3(xA,yA,zA,"ro")