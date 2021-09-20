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

Function3 = @(t) abs(cos(omega.*t)+sin(omega.*t)).^2;
Function4 = @(t) abs(exp((i.*t))).^2;
pwr1 = 1/(2*T) * integral(Function3,-T,T);
pwr2 = 1/(2*T) * integral(Function4,-T,T);
%e^ix = cos(x) + isin(x)
%1 = abs(e^x)^2

t2 = [-10:0.005:10];
y2 = periodicddf(t2);
figure
plot(t2,y2)
title('Question 2 Plot')
legend('Periodic Dirac Delta')
%Note, for plotting purposes it would be better to define 

function [y] = periodicddf(x)
%This function assumes a period of 1. An adjustable period function could
%be made easily by asking for another argument.
y = zeros(1,length(x));
for i=1:length(x)    
    if floor(x(i)) == ceil(x(i))
        y(i) = 1*10^9; %Note, for plotting purposes this is defined as
    end                %a billion, but for realism's sake it should be "Inf"
end
end