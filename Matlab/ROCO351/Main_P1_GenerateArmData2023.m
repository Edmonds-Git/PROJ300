%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% all rights reserved
% Author: Dr. Ian Howard
% Associate Professor (Senior Lecturer) in Computational Neuroscience
% Centre for Robotics and Neural Systems
% Plymouth University
% 116 Reynolds
% PL4 8AA
% Plymouth, Devon, UK
% howardlab.com
% 21/09/2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Generate arm data to train inverse model
% you need to implement this script to run the assignment section 1`

close all
clear all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% your script from here onwards

%Define arm data

% what each value represents for reference
%armLen = [L1, L2]
%theta = [θ1, θ2]
%origin = [X0, Y0]

%define arrays
armLen = [0.4, 0.4];
theta = 0 + (pi-0).*rand(2,10000);
origin = [0, 0];

%confirm correct max and min values of theta
thetamax = max(theta);
thetamin = min(theta);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Run forward kinematics and save results
[P1,P2] = RevoluteForwardKinematics2D(armLen, theta, origin);
save("ArmData.mat","P1","P2","theta")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot
figure
hold on
title('10622544:Arm endpoint locations');
xlabel('X(m)');
ylabel('Y(m)');
plot(P2(1,:),P2(2,:),'ro','DisplayName','Endpoint')
plot(origin(1,1),origin(1,2),'kdiamond','DisplayName','Origin')
legend
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This robotic arm has an effective range of + or -0.8m in the X dimension and
%between -0.4 and 0.8 in the Y dimension. In the X dimension however it
%appears unable to reach most of the positive side





