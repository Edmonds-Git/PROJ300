close all
clear all
clc

robot = rigidBodyTree;
bodies = cell(6,1);
joints = cell(6,1);
dhparams = [0.029 pi/2 0.108  0;
            0.120 0 0 0;
            0.020 -pi/2 0 0;
            0 pi/2 0.120 0;
            0 -pi/2 0 0;
            0 0 0.03 0];
for i = 1:6
    bodies{i} = rigidBody(['body' num2str(i)]);
    if i == 4
        joints{i} = rigidBodyJoint(['jnt' num2str(i)],"fixed");
    elseif i == 6
        joints{i} = rigidBodyJoint(['jnt' num2str(i)],"fixed");
    else
        joints{i} = rigidBodyJoint(['jnt' num2str(i)],"revolute");
    end
    setFixedTransform(joints{i},dhparams(i,:),"dh");
    bodies{i}.Joint = joints{i};
    if i == 1 % Add first body to base
        addBody(robot,bodies{i},"base")
    else % Add current body to previous body by name
        addBody(robot,bodies{i},bodies{i-1}.Name)
    end
end

robot.Bodies{2}.Joint.HomePosition = -pi/2;
showdetails(robot)
%figure(Name="Robot Model")
% show(robot);
gui = interactiveRigidBodyTree(robot,MarkerScaleFactor=0.05);