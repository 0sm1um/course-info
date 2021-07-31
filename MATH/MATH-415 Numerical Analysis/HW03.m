%HW 3
clear all
clc
%% 5.2

T = [];
for n = 3:500
A=magic(n); 
Ti=cputime; 
d=det(A); 
T=[T, (cputime - Ti)];
end

P1 = polyfit(3:500,T,1)
P2 = polyfit(3:500,T,2)
P3 = polyfit(3:500,T,3)
P4 = polyfit(3:500,T,4)

t = []; NN =3:500;
for n = NN
A=magic(n); tt=cputime; d=det(A); t=[t, cputime -tt];
end
c= polyfit(NN ,t,4)

%Based on the coefficiants of 
%% 5.3

%% 5.5

%% 5.8

%% 5.9

%% 5.10