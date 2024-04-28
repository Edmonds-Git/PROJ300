%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Based on, 
% ADAM: A METHOD FOR STOCHASTIC OPTIMIZATION
% Diederik P. Kingma*                    Jimmy Lei Ba∗
% University of Amsterdam, OpenAI         University of Toronto
% dpkingma@openai.com                     jimmy@psi.utoronto.ca
% https://arxiv.org/abs/1412.6980
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Adam Inverse Network
% Author: Thomas Edmonds
% Robotics Student
% University Of Plymouth
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%load Forward Kinematics data
load("ArmData.mat") % (EndP, theta)

Alpha =0.001; % Stepsize
Beta1 = 0.9;  % Exponential Decay rates for the moment estimates
Beta2 = 0.999;
E = 10^-8;

Ftheta = theta; % Objective function
Theta  = EndP;  % Initial Parameter vector

Mo = 0; %first moment vector
Vo = 0; %second moment vector
t  = 0; % Timestep

% For looping
iterations = 200;
%
for iteration = 1:itearations
    t = t+1;
    g(t) = f'(x(t-1));
end