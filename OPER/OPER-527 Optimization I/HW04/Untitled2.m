clear all;clc
syms x(t) i(t) t
R = 1*10^3; L = 1; C = 1*10^-3;
equation1 = diff(x,t) == C*i + R*diff(i,t,1) + L*diff(i,t,2);
equation2 = x == R*i + L*diff(i,t,1);

soln1 = dsolve(equation2)
pretty(soln1);