function [x,y,z] = Forward_kinematics_test(i,theta)

d = [8 0 0 18];
q = [theta(1,i) theta(2,i) theta(3,i) theta(4,i)];
r = [0 14 0 0];
a = [pi/2 0 0 0];

T1 = TVec(1,d,q,r,a);
T2 = TVec(2,d,q,r,a);
T3 = TVec(3,d,q,r,a);
T4 = TVec(4,d,q,r,a);

TM = T1*T2*T3*T4;

x = TM(1,4);
y = TM(2,4);
z = TM(3,4);