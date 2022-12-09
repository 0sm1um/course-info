clear all
clc
%% Problem 1

A = [1,2,0;
     5,0,3;
     -9,0,5];
 B = [4,0,2]';
 C = [8,2,0];
 D = [0];
 
 [num1, den1] = ss2tf(A,B,C,D);
 
 %% Problem 2
 
num2 = [0 1 3 2];
den2 = [1 -6 1 -6];
sys = tf(num2,den2);
t = linspace(0,120,1000);
step(sys,t)
[A2,B2,C2,D2]=tf2ss(num2, den2)
 
 
 %% Problem 4
 num4 = [4 40 64 0];
 den4 = [2 11 14 1];
[A4,B4,C4,D4] = tf2ss(num4, den4)
 
 %% Problem 5
 % See example 2.10, though result is slightly wrong. 0.5 is wrong
 
 x01 = [3 2]'
 x02 = [2 3]'
 
 %% Problem 6
 
 
 
 %% Problem 7