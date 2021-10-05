%Numerical Methods HW01
clear all
clc
%% Problem 1.9

n = 100;

I = zeros(n+2 ,1); 
I(1) = (exp(1)-1)/ exp(1);
for i = 0:n
    I(i+2) = 1 - (i+1)*I(i+1);
end

%This result agrees with the book's answer. The computer oscillates between
%increasingly large numbers of opposite sign, while the true limit
%approaches zero.

%% Problem 1.10
size = 50;
z = zeros(1,size);
z(1) = 2;

for i = [1:size-1]
    n = i+1;
    z(1,i+1) = 2^(n-(1/2)) * sqrt(1 - sqrt(1 - (4^(1-n)*z(1,i)^2)));
end


%% Problem 1.11
%MONTE CARLO INTEGRATION!!!
n = 100000000;
x = rand(n,1); y = rand(n,1);
r = x.^2+y.^2;
density = 0;
for i = [1:n]
    if r(i) <= 1
        density = density + 1;
    end
end
density = density/n;
monteCarloPi=4*density

%% Problem 1.12

n = 10;

piEstimate = 0;
for i = [0:n]
    piEstimate= piEstimate + 16^(-i) * (4/(8*i+1) - 2/(8*i+4) - 1/(8*i+5) - 1/(8*i+6));
end
piEstimate
pi

