clear all
clc
%Quiz Q1 Equivilant State Space model example 1.1 (circuits)
%Quiz Q2 Controllable state space model with feedback
%% Problem 1

A1 = [3,4,-1;
    4,-2,1;
    9,16,-2];
B1 = [3 6 1]';
C1 = [3 1 9];
D1 = [0];

soln1 = rank(obsv(A1, C1));
soln2 = rank(ctrb(A1, B1));

 %% Problem 2
 
 A2 = [1/2 1;
       -1/2 0];
 B2 = [0 0 ;
       0 0];
 C2 = [1];
 
 %% Problem 3
 num3 = [1 8 17 8];
 den3 = [1 6 11 6];
 
 num3 = [1 12 44 48];
 den3 = [1 9 23 15];
 [A3,B3,C3,D3] = tf2ss(num3,den3);
 
 
 
 %% Problem 5
 num4 = [0 1 2 3];
 den4 = [1 -2 2 0];
 
 [A4,B4,C4,D4] = tf2ss(num4,den4);
 Co4 = rank(ctrb(A4, B4))
 