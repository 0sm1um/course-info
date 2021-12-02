clear all; clc
%McDonalds Problem
syms x y

c1 = x^2 - 24*x - 12*y +200 
A = [2,4;
     1,3;
     1,0;
     0,1];
 b = [12,15,0,0]';
 
 lowerBound = zeros(4,1);
 
 x = linprog(c1,A,b,[],[],lowerBound,[]);