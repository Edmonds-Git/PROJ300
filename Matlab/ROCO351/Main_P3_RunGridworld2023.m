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

% Find path through maze
% you need to expand this script to run the assignment section 3

close all
clear all
clc

% YOU NEED TO DEFINE THESE VALUES
limits = [0 11; 0 11;]; % while this adds an extra white border compared to for example [0 10; 0 10] it makes plotted lines more accurate

% build the maze
maze = CMazeMaze11x11(limits);

% draw the maze
maze.DrawMaze();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% YOU NEED TO DEFINE THESE VALUES
% init the q-table
minVal = 0.01;
maxVal = 0.1;
maze = maze.InitQTable(minVal, maxVal);

%Qupdate Values
alpha = 0.2;
gamma = 0.9;

%Number of trials/episodes
trials = 100;
episodes = 1000;

% test values
state = 1;
action = 1;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% this will be used by Q-learning as follows:
q = maze.QValues(state, action);   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% YOU NEED TO FINISH OFF THIS FUNCTION
% get the reward from the action on the surrent state
% this will be used by Q-learning as follows:
reward = maze.RewardFunction(state, action);

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% YOU NEED TO FINISH OFF THIS FUNCTION
% build the transition matrix
maze = maze.BuildTransitionMatrix();
% print out values
maze.tm

% get the next state due to that action
% this will be used by Q-learning as follows:
resultingState = maze.tm(state, action);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% YOU NEED TO FINISH OFF THIS FUNCTION
% test random start
startTest = zeros(1,1000); %create vector for storing test values
for test = 1:1000
    startingState = maze.RandomStartingState();
    startTest(1,test) = startingState; %store startingState for plotting
end
figure
hold on
title('10622544: Random starting states: bins 121 samples 1000');
xlabel('Starting State');
ylabel('Frequency');
histogram(startTest,121)
hold off
% print out value
startingState
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Q-Learning
steps = zeros(episodes,trials);
StepC = 0;
for trialC = 1:trials
    state = startingState;
    for episodeC = 1:episodes
        while state ~= 121
            action = maze.GreedySelect(state);
            maze = maze.Q_Update(state, action, reward,alpha,gamma);
            state = maze.tm(state, action);
            StepC = StepC+1;
        end
        while state == 121
            startingState = maze.RandomStartingState();
            steps(episodeC,trialC) = StepC;
            StepC = 0;
            state = startingState;
        end
    end
end
maze.QValues
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Q Exploitation
state = 1;
statesvisited = ones(1,1);
statesvisitedXY = zeros(2,1);
statesvisitedXY(:,1) = 0.5;
statesXY = zeros(2,1);
while state ~= 121
    action = maze.Qexploitation(state);
    state = maze.tm(state, action);
    statesvisited = [statesvisited; state];
    [statesvisitedX,statesvisitedY] = ind2sub([11, 11],state);
    statesXY(1,1) = statesvisitedX-0.5;
    statesXY(2,1) = statesvisitedY-0.5;
    statesvisitedXY = [statesvisitedXY statesXY];
end

%Plot
maze.DrawMaze();
plot(statesvisitedXY(1,:), statesvisitedXY(2,:), 'xcy-', 'MarkerSize',15,'LineWidth',5)
title('10622544: Optimal Path over maze');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Mean & std deviation
MeanSteps = mean(steps);
stdSteps = std(steps);
%Plot
figure
hold on
title('10622544: Q-Learning in operation across multiple trials');
xlabel('Trial Number');
ylabel('Mean Number of Steps');
errorbar(MeanSteps,stdSteps)
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
save("P3Gridworld.mat")