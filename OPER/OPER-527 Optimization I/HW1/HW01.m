%% Question 2

x = linspace(-10,10,100);
y = -x.^4+3*x.^3+14*x.^2-48*x+32;

figure
plot(x,y)
title('Question 2a Plot')
xlabel('x')
ylabel('y')

%% Question 3
syms x
y  = -x.^4+3*x.^3+14*x.^2-48*x+32;
yprime = diff(y)
fzero(y)