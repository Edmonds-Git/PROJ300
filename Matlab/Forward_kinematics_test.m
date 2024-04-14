function [x,y,z] = Forward_kinematics_test(i,theta)

d = [108 0 0 120 0 30];
q = [theta(1,i) theta(2,i)-pi/2 theta(3,i) 0 theta(5,i) 0];
r = [29 120 20 0 0 0];
a = [-pi/2 0 -pi/2 pi/2 -pi/2 0];

T1 = TVec(1,d,q,r,a);
T2 = TVec(2,d,q,r,a);
T3 = TVec(3,d,q,r,a);
T4 = TVec(4,d,q,r,a);
T5 = TVec(5,d,q,r,a);
T6 = TVec(6,d,q,r,a);

TM = T1*T2*T3*T4*T5*T6;

x = TM(1,4);
y = TM(2,4);
z = TM(3,4);