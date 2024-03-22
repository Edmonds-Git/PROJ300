function [M] = TVec(i, d, q, r, a )
%T Summary of this function goes here
% syms  q1 q2 q3 q4

% [q1 d1 a1 pi];
% [q2 0 a2 0];
% [0 q3 0 0];
% [q4 d4 0 0];

% d1 = 0.2;
% d4 = 0.4;
% a1 = 0.2;
% a2 = 0.2;
if i == 1
    qi = q(1);
    ai = a(1);
    di = d(1);
    ri = r(1);
elseif i == 2
    qi = q(2);
    ai = a(2);
    di = d(2);
    ri = r(2);
elseif i == 3
    qi = q(3);
    ai = a(3);
    di = d(3);
    ri = r(3);
elseif i == 4 
    qi = q(4);
    ai = a(4);
    di = d(4);
    ri = r(4);
end

M1 = [cos(qi),-cos(ai)*sin(qi),sin(ai)*sin(qi),ri*cos(qi)];
M2 = [sin(qi),cos(qi)*cos(ai),-sin(ai)*cos(qi),ri*sin(qi)];
M3 = [0 sin(ai) cos(ai) di];
M4 = [0 0 0 1];

M = [M1;M2;M3;M4];
end

