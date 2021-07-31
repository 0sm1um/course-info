%HW 3
clear all
clc
%% 4.4
%{
t = [0 .5 1 1.5 2 2.5 3];
n =[100 147 178 192 197 199 200];
%Central Difference Computation
%Step Size
h = .5;
%Central Difference
dydx = [];
for x = [2:5]
dydx = [dydx (n(x+1)-n(x-1))/(2*h)];
end
fprime = [];
for i = [2:5];
fprime = [fprime 2*n(i)-0.01*n(i)^2];
end
compairison = [dydx;fprime]
%Looking pretty good here, I was actually surprised the approximation was
%so accurate.

%% 8.1

t0=0; y0=0; T=1;                    %Initialize variables.
f=@(t,y) sin(t)+y;                  %initialize function equation
y=@(t) 0.5*(exp (t)-sin(t)-cos(t));
h=2;
for k=1:10;
[tt ,uf]= feuler(f,[t0 ,T],y0 ,h);
[tt ,ub]= beuler(f,[t0 ,T],y0 ,h);
ef(k)=max(abs(uf-y(tt)));
eb(k)=max(abs(ub-y(tt)));
h=2*h;
end
pf=log(abs(ef(1:end -1)./ef(2:end )))/log(2);pf(1:2:end) %Forward Convergence Number
pb=log(abs(eb(1:end -1)./eb(2:end )))/log(2);pb(1:2:end) %Backward Convergence Number
%}
%% 8.2
t0=0; y0=0; T=1; N=100;                   %Initialize variables.
f=@(t,y) -t*exp(-y);                      %initialize function equation
[tt ,uf]= feuler(f,[t0 ,T],y0 ,N);

%If we decompose our function into different parts, we can see that the
%function -y is positive and increasing along the interval (0,1]
%the function e^-y is positive and increasing along the interval (0,1]
%the function t^2e^-2y is positive and increasing along the interval (0,1]
%And the second derivative -e^-y-t^2*e^(-2y) is negative and decreasing for
%the same interval.
%It follows then that there is an inflection point of our original function
%at t=1.
M = 9.98;
%L = max(L(t))=te^-y= e
L = exp(1);
value= ((exp(1)^L-1)*M)/(L*200)
%This means that only the first digit of our aproximation can be trusted.
%% 8.3
%{
phi = [.5];
data = [];
for h = [0:.25:2]
    for i = [1:100]
        phi(i+1) = phi(i)-h*1*exp(-phi(i));
    end
    data = [data; phi];
end
data = [[0:.25:2]' data];
%}