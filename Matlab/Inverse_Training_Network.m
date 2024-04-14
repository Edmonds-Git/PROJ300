close all
clear all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% your script from here onwards
%Timer
fullt=tic;
%load ArmData
load("ArmData.mat")
%definitions
Target = theta;
InputX = P2;
OutputVec = zeros(6,10000);
HiddenUnits = 10;
InputAugment = ones(3,10000);
%InputAugment (:,:) = 1;
InputX = [InputX; InputAugment];
%define iteration used for running an episode
iteration = 1000;
%define learning rate alpha
Alpha = 0.0001;
% Weights
Weight1 = rand(HiddenUnits,6);
Weight2 = rand(6,HiddenUnits+1);
% error progression
errorprogression = zeros(6,iteration);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Train Weights
for iterations= 1:iteration
    iterationt=tic;
    %setup/reset SSE
    SSE = 0;
    for sample = 1:10000
        %Upkeep
        InputS = InputX(:, sample);
        TargetS = Target(:,sample);
        Weight2Bar = Weight2(:,1:HiddenUnits);
        %Sigmoid Layer
        net = Weight1*InputS;
        %OutputS = 1./(1+exp(-net));
        if net > 0              %Replaced Sigmoid With ReLU
            OutputS = net;
        else
            OutputS = net*0.0;
        end
        OutputSA = [OutputS;1];
        %Linear Output Layer
        net2 = Weight2*OutputSA;
        Output = net2;
        %Back propagation
        OutputDelta = -(TargetS-Output);
        %SigmoidDelta = (Weight2Bar'*OutputDelta).*OutputS.*(1-OutputS); 
        if OutputDelta > 0
            SigmoidDelta = OutputDelta.*1; %Hopefully Replaced Sigmoid With ReLU
        else
            SigmoidDelta = OutputDelta.*0.0;
        end
        SigmoidError = SigmoidDelta.*InputS';
        OuputError = OutputDelta.*OutputSA';
        %Update Weights
        Weight1 = Weight1 - Alpha*SigmoidError;
        Weight2 = Weight2 - Alpha*OuputError;
        % Cumulative error
        SSE = SSE + ((TargetS-Output).^2);
    end
    %average error
    errorprogression(:,iterations) = SSE/10000;
    iterations
    toc(iterationt)
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot Error
figure
hold on
title('10622544: Error Progression');
xlabel('Iteration');
ylabel('SSE');
grid on
plot(errorprogression(1,:),'r-','DisplayName','X Error')
plot(errorprogression(2,:),'b-','DisplayName','Y Error')
legend
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Apply Trained Weights to Input data
for sample = 1:10000
        %Upkeep
        InputS = InputX(:, sample);
        TargetS = Target(:,sample);
        %Sigmoid Layer
        net = Weight1*InputS;
        if net > 0              %Replaced Sigmoid With ReLU
            OutputS = net;
        else
            OutputS = net*0.0;
        end
        OutputSA = [OutputS;1];
        %Linear Output Layer
        net2 = Weight2*OutputSA;
        Output = net2;
        OutputVec(:,sample) = Output;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Apply forward kinematics to inverse values
armLen = [0.4, 0.4];
origin = [0, 0];
for i = 1:10000
    [x,y,z] = Forward_kinematics_test(i,OutputVec);
    xA(1,i) = x;
    yA(1,i) = y;
    zA(1,i) = z;
end
P22 = [xA;yA;zA];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Old Testing code
save("Angles.mat","OutputVec")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot
figure
tiledlayout(3,2);

%Random theta
nexttile;
hold on
title('10622544: Random theta Values');
xlabel('X(m)');
ylabel('Y(m)');
grid on
plot(theta(1,:),theta(2,:),'bo','DisplayName','Endpoint')
legend
hold off

%Random Endpoints
nexttile;
hold on
title('10622544: Random Arm endpoint locations');
xlabel('X(m)');
ylabel('Y(m)');
grid on
plot(P2(1,:),P2(2,:),'bo','DisplayName','Endpoint')
plot(origin(1,1),origin(1,2),'kdiamond','DisplayName','Origin')
legend
hold off

%Inverse theta
nexttile;
hold on
title('10622544: Inverse generated theta Values');
xlabel('X(m)');
ylabel('Y(m)');
grid on
plot(OutputVec(1,:),OutputVec(2,:),'ro','DisplayName','Endpoint')
legend
hold off

%Inverse Endpoint
nexttile;
hold on
title('10622544: Inverse Arm endpoint locations');
xlabel('X(m)');
ylabel('Y(m)');
grid on;
plot(P22(1,:),P22(2,:),'ro','DisplayName','Endpoint')
plot(origin(1,1),origin(1,2),'kdiamond','DisplayName','Origin')
legend
hold off

%overlapping theta
nexttile;
hold on
title('10622544: Overlapping theta values');
xlabel('X(m)');
ylabel('Y(m)');
grid on
plot(theta(1,:),theta(2,:),'bo','DisplayName','Random theta')
plot(OutputVec(1,:),OutputVec(2,:),'ro','DisplayName','Inverse theta')
legend
hold off

%overlapping Endpoint
nexttile;
hold on
title('10622544: Overlapping Arm endpoint locations');
xlabel('X(m)');
ylabel('Y(m)');
grid on
plot(P2(1,:),P2(2,:),'bo','DisplayName','Random Endpoint')
plot(P22(1,:),P22(2,:),'ro','DisplayName','Inverse Endpoint')
plot(origin(1,1),origin(1,2),'kdiamond','DisplayName','Origin')
legend
saveas(gcf,'Inverse.png')
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% timer end
toc(fullt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Save
save("P2TrainNN.mat")