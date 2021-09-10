% Project 3
clear all
clc

%% Problem One
f=@(x) exp(-x)-x;
newtmethod(f,0,10^-4);
secmethod(f,0,1,10^-4);
% Both functions give the same answer in the same number of steps. So I
% would call them equally viable.
%% Problem Two

f=@(x) x^2-8*x-2*cos(x)+11;
g=sym(f);
g=diff(g);
fprime=matlabFunction(g); %The previous four lines are lifted straight 
%from my Newton's method function)

zero=newtmethod(fprime,0,10^-4);

fprime(zero-1)
fprime(zero+1)

%The absolute minimum is located at 4.9676, as the function goes from
%decreasing to increasing.

%% Problem Three

f=@(a) (a+sqrt(a))*((30-a)+(sqrt(30-a)))-285;
a=newtmethod(f,1,10^-4)
b=30-a