clear all; clc
%% Question 2
x = linspace(-10,10,100);
y = -x.^4+3*x.^3+14*x.^2-48*x+32;
figure
plot(x,y)
title('Question 2a Plot')
xlabel('x')
ylabel('y')
max(y);
%% Question 3
f = @(x) (sin(x)+1)*exp(10*x-x^2-25); % Function Handle for GaussNewton Function
x = linspace(0,10,100);
y = (sin(x)+1).*exp(10.*x-x.^2-25);
figure
plot(x,y)
title('Question 3 Plot')
xlabel('x')
ylabel('y')
newtmax = gaussnewton(f,6,0.00001);
%disp(['The maximizer is ',num2str(newtmax(1)),'. The maximum is ',num2str(newtmax(2)),'. Found in ',num2str(newtmax(3)),' iterations.'])
max(y);
%The maximizer is 5.814 The maximum is 0.28242 Found in 4 iterations.
%% Question 4
x = linspace(0,20,100);
y = 17-0.3.*x;
figure
plot(x,y)
title('Question 4a Plot')
xlabel('x')
ylabel('y')
max(y);
%C Its a line, so the maxima/minima are at the start/end of the interval.
%therefore the maximizer is 0. Minimizer is 20.
%The maximum is 17, the minimum is 11.

%% Question 5
x = linspace(0,1.00659,100);
y = 15+cos(13/7).*x;
figure
plot(x,y)
title('Question 5a Plot')
xlabel('x')
ylabel('y')
max(y);
%C Its a line, so the maxima/minima are at the start/end of the interval.
%therefore the maximizer is 0. Minimizer is 1.006.
%Maximum is 15, minimum is 14.71