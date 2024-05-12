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


classdef CMazeMaze11x11
    % define Maze work for RL
    %  Detailed explanation goes here
    
    properties
        
        % parameters for the gmaze grid management
        %scalingXY;
        blockedLocations;
        cursorCentre;
        limitsXY;
        xStateCnt
        yStateCnt;
        stateCnt;
        stateNumber;
        totalStateCnt
        squareSizeX;
        cursorSizeX;
        squareSizeY;
        cursorSizeY;
        stateOpen;
        stateStart;
        stateEnd;
        stateEndID;
        stateX;
        stateY;
        xS;
        yS
        stateLowerPoint;
        textLowerPoint;
        stateName;
        
        % parameters for Q learning
        QValues;
        tm;
        actionCnt;
        
        %parameters added
        OpenState;
        BlockedID;
    end
    
    methods
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % constructor to specity maze
        function f = CMazeMaze11x11(limitsXY)
            
            % set scaling for display
            f.limitsXY = limitsXY;
            f.blockedLocations = [];
            
            % setup actions
            f.actionCnt = 4;
            
            % build the maze
            f = SimpleMaze11x11(f);
            
            % display progress
            disp(sprintf('Building Maze CMazeMaze11x11'));
            
        end
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % build the maze
        function f = SetMaze(f, xStateCnt, yStateCnt, blockedLocations, startLocation, endLocation)
            
            % set size
            f.xStateCnt=xStateCnt;
            f.yStateCnt=yStateCnt;
            f.stateCnt = xStateCnt*yStateCnt;
            
            % compute state countID
            for x =  1:xStateCnt
                for y =  1:yStateCnt
                    
                    % get the unique state identified index
                    ID = x + (y -1) * xStateCnt;
                    
                    % record it
                    f.stateNumber(x,y) = ID;
                    
                    % also record how x and y relate to the ID
                    f.stateX(ID) = x;
                    f.stateY(ID) = y;
                end
            end
            
            % calculate maximum number of states in maze
            % but not all will be occupied
            f.totalStateCnt = f.xStateCnt * f.yStateCnt;
            
            
            % get cell centres
            f.squareSizeX= 1 * (f.limitsXY(1,2) - f.limitsXY(1,1))/f.xStateCnt;
            f.cursorSizeX = 0.5 * (f.limitsXY(1,2) - f.limitsXY(1,1))/f.xStateCnt;
            f.squareSizeY= 1 * (f.limitsXY(2,2) - f.limitsXY(2,1))/f.yStateCnt;
            f.cursorSizeY = 0.5 * (f.limitsXY(2,2) - f.limitsXY(2,1))/f.yStateCnt;
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % init maze with no closed cell
            f.stateOpen = ones(xStateCnt, yStateCnt);
            f.stateStart = startLocation;
            f.stateEnd = endLocation;
            f.stateEndID = f.stateNumber(f.stateEnd(1),f.stateEnd(2));
            
            % put in blocked locations
            for idx = 1:size(blockedLocations,1)
                bx = blockedLocations(idx,1);
                by = blockedLocations(idx,2);
                f.stateOpen(bx, by) = 0;
            end
            
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % get locations for all states
            for x=1:xStateCnt
                for y=1:yStateCnt
                    
                    % start at (0,0)
                    xV = x-1;
                    yV = y-1;
                    
                    % pure scaling component
                    % assumes input is between 0 - 1
                    scaleX =  (f.limitsXY(1,2) - f.limitsXY(1,1)) / xStateCnt;
                    scaleY = (f.limitsXY(2,2) - f.limitsXY(2,1)) / yStateCnt;
                    
                    % remap the coordinates and add on the specified orgin
                    f.xS(x) = xV  * scaleX + f.limitsXY(1,1);
                    f.yS(y) = yV  * scaleY + f.limitsXY(2,1);
                    
                    % remap the coordinates, add on the specified orgin and add on half cursor size
                    f.cursorCentre(x,y,1) = xV * scaleX + f.limitsXY(1,1) + f.cursorSizeX/2;
                    f.cursorCentre(x,y,2) = yV * scaleY + f.limitsXY(2,1) + f.cursorSizeY/2;
                    
                    f.stateLowerPoint(x,y,1) = xV * scaleX + f.limitsXY(1,1);  - f.squareSizeX/2;
                    f.stateLowerPoint(x,y,2) = yV * scaleY + f.limitsXY(2,1); - f.squareSizeY/2;
                    
                    f.textLowerPoint(x,y,1) = xV * scaleX + f.limitsXY(1,1)+ 10 * f.cursorSizeX/20;
                    f.textLowerPoint(x,y,2) = yV * scaleY + f.limitsXY(2,1) + 10 * f.cursorSizeY/20;
                end
            end
        end
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % draw rectangle
        function DrawSquare( f, pos, faceColour)
            % Draw rectagle
            rectangle('Position', pos,'FaceColor', faceColour,'EdgeColor','k', 'LineWidth', 3);
        end
        
        % draw circle
        function DrawCircle( f, pos, faceColour)
            % Draw rectagle
            rectangle('Position', pos,'FaceColor', faceColour,'Curvature', [1 1],'EdgeColor','k', 'LineWidth', 3);
        end
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % draw the maze
        function DrawMaze(f)
            figure('position', [100, 100, 1200, 1500]);
            fontSize = 20;
            hold on
            h=title(sprintf('10622544: Maze wth %d x-axis X %d y-axis cells', f.xStateCnt, f.yStateCnt));
            set(h,'FontSize', fontSize);
            
            for x=1:f.xStateCnt
                for y=1:f.yStateCnt
                    pos = [f.stateLowerPoint(x,y,1)  f.stateLowerPoint(x,y,2)  f.squareSizeX f.squareSizeY];
                    
                    % if location open plot as blue
                    if(f.stateOpen(x,y))
                        DrawSquare( f, pos, 'b');
                        % otherwise plot as black
                    else
                        DrawSquare( f, pos, 'k');
                    end
                end
            end
            
            
            % put in start locations
            for idx = 1:size(f.stateStart,1)
                % plot start
                x = f.stateStart(idx, 1);
                y = f.stateStart(idx, 2);
                pos = [f.stateLowerPoint(x,y,1)  f.stateLowerPoint(x,y,2)  f.squareSizeX f.squareSizeY];
                DrawSquare(f, pos,'g');
            end
            
            % put in end locations
            for idx = 1:size(f.stateEnd,1)
                % plot end
                x = f.stateEnd(idx, 1);
                y = f.stateEnd(idx, 2);
                pos = [f.stateLowerPoint(x,y,1)  f.stateLowerPoint(x,y,2)  f.squareSizeX f.squareSizeY];
                DrawSquare(f, pos,'r');
            end
            
            % put on names
            for x=1:f.xStateCnt
                for y=1:f.yStateCnt
                    sidx=f.stateNumber(x,y);
                    stateNameID = sprintf('%s', f.stateName{sidx});
                    text(f.textLowerPoint(x,y,1),f.textLowerPoint(x,y,2), stateNameID, 'FontSize', 20)
                end
            end
        end
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % setup 11x11 maze
        function f = SimpleMaze11x11(f)
            
            xCnt=11;
            yCnt=11;
            
            % specify start location in (x,y) coordinates
            % example only
            %startLocation=[5 5];
            % YOUR CODE GOES HERE
            startLocation=[1 1];
            
            % specify end location in (x,y) coordinates
            % example only
            %endLocation=[6 6];
            % YOUR CODE GOES HERE
            endLocation=[11 11];
            
            % specify blocked location in (x,y) coordinates
            % example only
            %blockedLocations = [1 1; 2 2; 3 3;];
            % YOUR CODE GOES HERE
            f.blockedLocations = [3 1; 4 1; 6 1; 8 1; 11 1; 3 2; 4 2; 6 2; 8 2; 10 2; 4 3; 6 3; 1 4; 2 4; 4 4; 6 4; 8 4; 9 4; 10 4; 11 4; 4 5; 9 5; 11 5; 2 6; 6 6; 7 6; 11 6; 4 7; 8 7; 10 7; 11 7; 1 8; 4 8; 5 8; 6 8; 7 8; 8 8; 1 9; 2 9; 6 9; 7 9; 9 9; 10 9; 2 10; 4 10; 10 10; 4 11; 5 11; 6 11];
            % build the maze
            f = SetMaze(f, xCnt, yCnt, f.blockedLocations, startLocation, endLocation);
            
            % write the maze state
            maxCnt = xCnt * yCnt;
            for idx = 1:maxCnt
                f.stateName{idx} = num2str(idx);
            end
            
        end
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % reward function that takes a stateID and an action
        function reward = RewardFunction(f, stateID, action)
            
            % init to no reqard
            reward = 0;
            
            % YOUR CODE GOES HERE ....
            RE = zeros(121,4); %make reward for all states and actions 0
            RE(120,2) = 10; % make reward for going to the target 10 from the two states where its possible
            RE(110,1) = 10; 
            reward = RE(stateID, action); %reward is equal to reward matrix RE at the row of the current state and column of the action
        end
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % function  computes a random starting state;
        function startingState = RandomStartingState(f)
            startingState = 0;
            
            % YOUR CODE GOES HERE ....
             startingState = 1 + (120-1) .* rand(1,1); %random value between 120 and 1, dont need to include 121 as the start can't be the end
             startingState = round(startingState); %round to the nearest whole number
             while startingState == 121 || ismember(startingState,f.BlockedID) % repeats until starting state is neither 121 or a blocked state, 121 is included just to be safe 
                 startingState = 1 + (120-1) .* rand(1,1);
                 startingState = round(startingState);
             end
        end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % look for end state
        function endState = IsEndState(f, x, y)
            
            % default to not found
            endState=0;
            
            % YOUR CODE GOES HERE ....
            % unused
        end
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % init the q-table
        function f = InitQTable(f, minVal, maxVal)
            
            % allocate
            f.QValues = zeros(f.xStateCnt * f.yStateCnt, f.actionCnt);
            
            % YOUR CODE GOES HERE ....
            f.QValues = minVal+(maxVal-minVal).*rand(121,4) %generate a 121 by 4 matrix of values between minVal and maxVal
            Qmin = min(f.QValues) %These two are used to confirm the min and max values have been selected properly
            Qmax = max(f.QValues) 
        end
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % % build the transition matrix
        % look for boundaries on the grid
        % also look for blocked state
        function f = BuildTransitionMatrix(f)
            
            % allocate
            f.tm = zeros(f.xStateCnt * f.yStateCnt, f.actionCnt);
            
            % YOUR CODE GOES HERE ....
            f.BlockedID = (f.blockedLocations(:,1) + (f.blockedLocations(:,2)-1) * 11);
            f.OpenState = (1:121);
            yModCstate = zeros(1,121);

            %setup loop
            % A seperate loop is used to pregenerate the values which the
            % main loop uses to build the transition matrix as it needs to
            % compare to values which if calculated in the build loop
            % wouldnt exist until the next loop
            for Cstate = 1:121
                if ismember(Cstate,f.BlockedID)
                    f.OpenState(1,Cstate) = 0;
                end
                Cdiv = (Cstate-1)/11; % Cstate - 1 is used here to compensate for the fact that 11 mod 11 is one which means the final state in each row shows up as being on the row above.
                Cdiv = floor(Cdiv); % round Cdiv down as otherwise matlab leaves a decimal when doing modulo
                yModCstate(Cstate) = mod(Cdiv,11); %using modulo of the state divided by the number of columns we can find out which row each ID is on
            end
            % Build loop
            for Cstate = 1:121 
                if ismember(Cstate + 11, f.OpenState) % is Cstate +11 in a non blocked state within the limits?
                    f.tm(Cstate,1) = Cstate+11;
                else 
                    f.tm(Cstate,1) = Cstate;
                end
                if ismember(Cstate + 1, f.OpenState) && yModCstate(Cstate) == yModCstate(Cstate+1) %Is Cstate+1 a non blocked state within the limits and on the same row as Cstate?
                    f.tm(Cstate,2) = Cstate+1;
                else 
                    f.tm(Cstate,2) = Cstate;
                end
                if ismember(Cstate - 11, f.OpenState) % is Cstate -11 in a non blocked state within the limits?
                    f.tm(Cstate,3) = Cstate-11;
                else 
                    f.tm(Cstate,3) = Cstate;
                end
                if ismember(Cstate - 1, f.OpenState) && Cstate > 1 && yModCstate(Cstate) == yModCstate(Cstate-1) %Is Cstate-1 a non blocked state within the limits and on the same row as Cstate?
                    f.tm(Cstate,4) = Cstate-1;
                else 
                    f.tm(Cstate,4) = Cstate;
                end
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Q_Update
        function f = Q_Update(f,stateID, action, reward, alpha, gamma)
            nextstate = f.tm(stateID,action);
            f.QValues(stateID,action) = (f.QValues(stateID,action) +alpha*(reward+(gamma*max(f.QValues(nextstate,:)))-f.QValues(stateID,action)));
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Action Selection
        function action = GreedySelect(f,stateID) % 9 times out of ten select the best action from Q table otherwise explore for exploration rate of 0.1
            RandomAction = randi([1 10]);
            if RandomAction <= 9
                QAction = f.QValues(stateID,:);
                [~,action] = max(QAction,[],"linear"); % ~ is used to ignore the actual max value as we only want the index which is the second output
            end
            if RandomAction > 9
                action = randi([1 4]);
            end 
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Q Exploitation Function
        function action = Qexploitation(f,stateID)
            QAction = f.QValues(stateID,:);
            [~,action] = max(QAction,[],"linear"); % ~ sets the output to be ignored
        end
        
    end
end

