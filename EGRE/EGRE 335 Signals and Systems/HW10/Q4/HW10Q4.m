clear all; clc
%% Question 4
f = 10;
beta = 2*pi*f;
dt = 1/(20*beta);
T = 1/f;
tmax = 40*T;
Npoints = ceil(tmax/dt)-1;
X1 = 1.;
H1 = 1;
lambda = -3;
alpha = 2;
theta = pi/2;
phi = -atan(-(beta)/(alpha+lambda));
t = linspace(0,tmax,Npoints);
x = 5.*exp(-alpha.*t).*cos(2.*pi.*f.*t+theta).*heaviside(t);
h = 5.*exp(-lambda.*t).*heaviside(t);
y1 = ((alpha+lambda).*cos(theta).*exp(lambda.*t)-(alpha+lambda).*cos(beta.*t+theta).*exp(-alpha.*t)+beta.*sin(beta.*t+theta).*exp(-alpha.*t)-beta.*sin(theta).*exp(lambda.*t))./((alpha+lambda).^2+beta.^2);
y2 = (cos(theta-phi).*exp(lambda.*t)-exp(-alpha.*t).*cos(beta.*t+theta-phi))/(sqrt((alpha+lambda).^2+beta.^2));
ynum=conv(x,h,'full')*dt;

figure();
hold on
plot(t,y1,'- .');
plot(t,y2,'- .');
plot(t,ynum(1:length(ynum)/2+1),'- .');
title('Convolution Calculations')
xlabel('Time [s]');
ylabel('Voltage [V]');
legend('y1(t)','y2(t)','ynum(t)')



