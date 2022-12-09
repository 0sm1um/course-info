clear all
clc
%% Problem 1

% Example 2.2

Y1 = [4 1 2 2 4 2]'
TU1 = [2 -1 0 2 4 1]'

R1 = [0 0 0;
      1 0 1;
      0 1 1;
      -1 0 1;
      0 -1 1;
      0 -1 2];
  
soln1 = pinv(R1) * (Y1-TU1);
 %% Problem 2
 2.3
 syms t
 A2 = [1 1;
       0 1];
 B2 = [0 1]';
 C2 = [1 t];
 D2 = [0];
 
 
 soln2 = inv([A2]) * ([1 2*exp(5)]'+[1 2]')
 %% Problem 3

%{
A3 = [-10 -1 -2 -13; 13 6 5 7; 11 1 2 10; -14 -6 -5 -15];
B3 = [2 0 1 1]';
C3 = [1 1 0 2];
D3 = [0];
rank3 = isequal(rank(ctrb(A3,B3)), rank(obsv(A3,C3)));
T3 = [0 0 0; C3*B3 0 0; C3*A3*B3 C3*B3 0];
soln3 = rank(T3)

%% Problem 4
syms a1 a2 a3 t
 % Showing the A, B, C, and D matrices %
 A4 = [0 1 0; 0 0 1; 0 0 -a1];
 B4 = [0; 0; t];
 C4 = [1 0 -1];
 D4 = 1;
 % Determining the observable and controllable matrices %
 R4 = [C4; C4*A4; C4*A4*A4];
 Q4 = ctrb(A4, B4);
 % Determines the T-matrix %
 T4 = [0 0 0; C4*B4 0 0; C4*A4*B4 C4*B4 0];
 % Y and u %
 Y4=[0; 2; 4];
 u4=[0; 2; 4];
 xt4=pinv(R4)*(Y4-T4*u4)
 % The solution for v(0) %
 eval4 = subs(xt,t,1);
 v4 = subs(eval4, 2)
 %v4 = [-2; 6; -2]

 %}
 %% Problem 5 
 %(Example 2.8?)
syms a1 a2 a3 t5
 % Showing the A, B, C, and D matrices %
 A5 = [0 1 0; 0 0 1; 0 0 -a1];
 B5 = [0; 0; 1];
 C5 = [1 0 -1];
 D5 = 1;
 % Determining the observable and controllable matrices %
 R5 = [C5; C5*A5; C5*A5*A5];
 %Q5 = ctrb(A5, B5);
 % Determines the T-matrix %
 T5 = [0 0 0; C5*B5 0 0; C5*A5*B5 C5*B5 0];
 % Y and u %
 Y5=[0; 1; 3];
 u5=[0; 2; 4];
 xt5=pinv(R5)*(Y5-T5*u5)
 
 % Determining the controllable matrix %
 Q = ctrb(A5, B5);
 % x(0-) and x(0+) %
 x0minus=[1; -4; 3];
 x0plus=[2; -1; 0];
 xi5=pinv(Q)*(x0plus-x0minus)
 % The solution for xi %
 