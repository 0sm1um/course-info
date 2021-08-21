%Numerical Methods HW01
clear all
clc
%% Problem 2.11
syms x
f = x^3 - 3*x^2*2^-x + 3*x*4^-x - 8^-x;
solution211 = newtmethod(matlabFunction(f),0,eps)

%% Problem 2.18
syms x
f = x^3 - 3*x^2*2^-x + 3*x*4^-x - 8^-x;
solution218 = altnewtmethod(matlabFunction(f),0,eps)
difference = abs(solution211(1) - solution218(1))
%While both error calculations are quite close together, the former error
%calculation would be more accurate as the results "flatten out" faster
%when plotted.