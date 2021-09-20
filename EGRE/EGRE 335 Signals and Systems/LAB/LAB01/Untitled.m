clear all
clc
%% CHAPTER 01 REVIEW

T = 1;
t1 = linspace(-2*T,2*T, 100);
omega = 2*pi*T;
F1 = cos(omega*t1);
F2 = sin(omega*t1);
F3 = F1 + i*F2;
figure
hold on
plot(t1,F1)
plot(t1,F2)
title('Question 1 Plot')
legend('F1', 'F2')
t2 = linspace(-10,10,21);

Function3 = @(t) abs(cos(omega.*t)+sin(omega.*t)).^2;
Function4 = @(t) abs(exp((i.*t))).^2;
pwr1 = 1/(2*T) * integral(Function3,-T,T);
pwr2 = 1/(2*T) * integral(Function4,-T,T);
%e^ix = cos(x) + isin(x)
%1 = abs(e^x)^2
