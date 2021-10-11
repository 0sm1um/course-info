clear all; clc
f = 10;
beta = 2*pi*f;
dt = 1/(20*beta);
T = 1/f;
tmax = 40*T;
Npoints = ceil(tmax/dt)-1;
X1 = 1.;
H1 = 1;
lambda = -1;
alpha = 2;
theta = pi/2;
t = linspace(0,tmax,Npoints);

figure();
hold on
plot(t,x,'- .');
title('x(t)')
xlabel('Time [s]');
ylabel('Component 1 Voltage [V]');
legend('Moving mean, k=5','Moving mean, k=10','Moving mean, k=20','Moving mean, k=50','Moving mean, k=200')
