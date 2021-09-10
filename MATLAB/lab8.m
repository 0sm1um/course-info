% lab8

clear all
clc

%% Problem One
f=@(x) (x.^2-9)*(x)*(x-2)*(x.^2+2*x+1);
%Roots at x=-3, x=-1, x=0, x=2, x=3
xi=[-1.5 -4 1.9 -3.5];
xn=[1.7 -.5 4 3.6];
data=[];

for i=1:4
    data=[data; bismethod(f,xi(i),xn(i),10^-4)];
end

%The function converges to 0.001(probably zero), -3, and 2(twice).

%% Problem Two

f=@(x) (x.^4-4*x.^3+5*x-1);
a=[-2 1 0];
b=[0 3 6];
steps=[];
data2=[];


for i=1:3
    steps=[steps; bisection_theorem(a(i),b(i),10^-3)];
end

for i=1:3
    data2=[data2; bismethod(f,a(i),b(i),10^-3)];
end

%The predicted number of steps seems to check out. All three intervals
%produced answers within tolerance in the predicted ranges.