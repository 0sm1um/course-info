% Project 1

clear
clc

%% Problem One

cooling(80,36,3)

%% Problem Two

A = [0 1; 0 0]

A0=A^2

%% Problem Three

x=[0:.25:10];
%I chose values between 0 and 10, because y increases much faster than the
%rest of the functions. As such, the curves won't look very defined with a
%larger range. I also chose increments of .25 so that the plots would look like
%curves and not jagged lines.

y1=x.^4-3*x.^2+5*x-9;
y2=4*x.^3-6*x+5;
y3=12*x.^2-6;

figure(1);
plot(x,y1,'r:',x,y2,'g',x,y3,'b--')
title('y and friends');
xlabel('x');
ylabel('y');

%% Problem Four

Area=inscrCircle(144)

%% Problem Five

load census.mat;

t=cdate-1790;
t=t';
p1=5.8172*exp(.0208*t);
p2=.0065*t.^2-.00925*t+5.583;

figure(2);
plot(t,pop,'r',t,p1,'g',t,p2,'b')
title('Projected Populatons');
xlabel('time');
ylabel('population');

%p2 vs time is the most accurate curve of best fit.
