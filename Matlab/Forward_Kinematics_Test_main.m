close all
clear all
clc

samples = 10000;
theta = 0 + (pi-0).*rand(6,samples);
origin = [0, 0, 0];
xA = [1,samples];
yA = [1,samples];
zA = [1,samples];

for i = 1:samples
    [x,y,z] = Forward_kinematics_test(i,theta);
    xA(1,i) = x;
    yA(1,i) = y;
    zA(1,i) = z;
end
EndP = [xA;yA;zA];

save("ArmData.mat","EndP","theta")
figure
hold on
plot3(xA,yA,zA,"ro")
plot3(origin(1,1),origin(1,2),origin(1,3),'kdiamond','DisplayName','Origin')
saveas(gcf,'Forward.m')