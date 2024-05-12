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

% Move arm through maze
% you need to implement this script to run the assignment section 4

close all
clear all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% your script from here onwards


% Load previous work
load("ArmData.mat");
load("P2TrainNN.mat");
load("P3Gridworld.mat");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% set new limits and regenerate maze
limits = [-0.6 -0.2; -0.2 0.3];
maze = CMazeMaze11x11(limits);

% Plot scaled maze overlapping arm workspace to ensure it fits
maze.DrawMaze();
plot(P22(1,:),P22(2,:),'ro','DisplayName','Endpoint')
maze.DrawMaze();
plot(P2(1,:),P2(2,:),'ro','DisplayName','Endpoint')

% Scale the input coordinates to fit the new maze
scalingstatesvisitedXY = statesvisitedXY +0.5; % add 0.5 to coordinates as 0.5 was taken away from them previously to center the plot
svXYsize = size(statesvisitedXY, 2);
InputX = zeros(2,svXYsize);
for X = 1:svXYsize
    InputX(1,X) = maze.cursorCentre(scalingstatesvisitedXY(1,X),scalingstatesvisitedXY(2,X),1);
    InputX(2,X) = maze.cursorCentre(scalingstatesvisitedXY(1,X),scalingstatesvisitedXY(2,X),2);
end

% Augment the input 
InputAugmentP4 = ones(1,21);
InputX = [InputX; InputAugmentP4];
OutputVecP4 = zeros(2,21);
% start loop for applying trained weights
for sample = 1:svXYsize
        %Upkeep
        InputS = InputX(:, sample);
        TargetS = Target(:,sample);
        %Sigmoid Layer
        net = Weight1*InputS;
        OutputS = 1./(1+exp(-net));
        OutputSA = [OutputS;1];
        %Linear Output Layer
        net2 = Weight2*OutputSA;
        Output = net2;
        OutputVecP4(:,sample) = Output;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% forward kinematics

[P4P1,P4P2] = RevoluteForwardKinematics2D(armLen, OutputVecP4, origin);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot

maze.DrawMaze();
plot(InputX(1,:), InputX(2,:), 'xcy-', 'MarkerSize',15,'LineWidth',5,'DisplayName','Optimal')
plot(P4P2(1,:), P4P2(2,:), 'xm-', 'MarkerSize',15,'LineWidth',5,'DisplayName','Generated')
title('10622544: Optimal and Generated Path over maze');
legend

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Animation
maze.DrawMaze();
plot(InputX(1,:), InputX(2,:), 'xcy-', 'MarkerSize',15,'LineWidth',5,'DisplayName','Optimal') %plot optimal line for comparison
h = animatedline('Color','r','LineStyle','-','LineWidth',3); % define arm plot which will be removed after each movement to avoid covering the maze
L = animatedline('Color','r','LineStyle','-','LineWidth',3); % define new path plot which is not removed

for k = 1:svXYsize
    axis([-0.7,0.2, -0.3,0.5]);
    armX = [origin(1,1),P4P1(1,k),P4P2(1,k)];
    armY = [origin(1,2),P4P1(2,k),P4P2(2,k)];
    addpoints(h,armX,armY) % plot arm movement for this point
    addpoints(L,P4P2(1,k),P4P2(2,k)); % plot generated path
    drawnow; 
    pause(0.5); % add delay so the animation is visible
    clearpoints(h) % remove arm so the maze can be seen clearly
end
