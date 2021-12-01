clear all; clc
















%SIR HW Problem
%{
syms S(t) I(t) R(t) a b



e1 = diff(S,t) == -a*S*I;
e2 = diff(I,t) == b*S*I - b*I;
e3 = diff(R,t) == b*I;

c1 = S(0) == 990;
c2 = I(0) == 10;
c3 = R(0) == 0;

odes = [e1;e2;e3];
conds = [c1;c2;c3];
%}
Sn = @(S,I) -a*S*I;
In = @(S,I) b*S*I - b*I;
Rn = @(I) b*I;
t = 25;
for i=1:t
[t, y] = Euler(t0, y0, h, tn);

function yn = Euler(t0, y0, h, f)
    y = zeros(size(t));
    y(1) = y0;
    yn = y0 + h * f(y, t);
end