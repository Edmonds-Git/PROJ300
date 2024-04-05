close all
clear all
clc

robot = rigidBodyTree;
bodies = cell(6,1);
joints = cell(6,1);
dhparams = [29 pi/2 108  0;
            120 0 0 0;
            20 pi/2 0 0;
            0 0 120 0;
            0 0 0 0;
            30 0 0 0];
for i = 1:6
    bodies{i} = rigidBody(['body' num2str(i)]);
    joints{i} = rigidBodyJoint(['jnt' num2str(i)],"revolute");
    setFixedTransform(joints{i},dhparams(i,:),"dh");
    bodies{i}.Joint = joints{i};
    if i == 1 % Add first body to base
        addBody(robot,bodies{i},"base")
    else % Add current body to previous body by name
        addBody(robot,bodies{i},bodies{i-1}.Name)
    end
end

showdetails(robot)
figure(Name="Robot Model")
% show(robot);
gui = interactiveRigidBodyTree(robot,MarkerScaleFactor=0.5);