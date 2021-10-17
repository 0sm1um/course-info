clear all; clc
%% Question 2
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
phi = -atan(-(beta)/(alpha+lambda));
t = linspace(0,tmax,Npoints);
x = 5.*exp(-alpha.*t).*cos(2.*pi.*f.*t+theta).*heaviside(t);
h = 5.*exp(-lambda.*t);
y1 = ((alpha+lambda).*cos(theta).*exp(lambda.*t)-(alpha+lambda).*cos(beta.*t+theta).*exp(-alpha.*t)+beta.*sin(beta.*t+theta).*exp(-alpha.*t)-beta.*sin(theta).*exp(lambda.*t))./((alpha+lambda).^2+beta.^2);
y2 = (cos(theta-phi).*exp(lambda.*t)-exp(-alpha.*t).*cos(beta.*t+theta-phi))/(sqrt((alpha+lambda).^2+beta.^2));
ynum=conv(x,h,'full')*dt;

figure();
hold on
plot(t,x,'- .');
plot(t,h,'- .');
title('Input and Impulse Response')
xlabel('Time [s]');
ylabel('Voltage [V]');
legend('x(t)','h(t)')

figure();
hold on
plot(t,ynum(1:length(ynum)/2+1),'- .');
plot(t,y1,'- .');
%plot(t,y2,'- .');
title('Numerical y(t) and Analytical y(t)')
xlabel('Time [s]');
ylabel('Voltage [V]');
legend('Numerical y(t)','Analytical y(t)')

figure();
hold on
%plot(t,ynum(1:length(ynum)/2+1),'- .');
plot(t,y1,'- .');
plot(t,y2,'- .');
title('Long Analytical Form(t) and Short Analytical y(t)')
xlabel('Time [s]');
ylabel('Voltage [V]');
legend('Long y(t)','short y(t)')

%% Question 3
f = 10;
beta = 2*pi*f;
dt = 1/(20*beta);
T = 1/f;
tmax = 40*T;
Npoints = ceil(tmax/dt)-1;
X1 = 1.;
H1 = 1;
lambda = 1;
alpha = 2;
theta = pi/2;
phi = -atan(-(beta)/(alpha+lambda));
t = linspace(0,tmax,Npoints);
x = 5.*exp(-alpha.*t).*cos(2.*pi.*f.*t+theta).*heaviside(t);
h = 5.*exp(-lambda.*t);
y1 = ((alpha+lambda).*cos(theta).*exp(lambda.*t)-(alpha+lambda).*cos(beta.*t+theta).*exp(-alpha.*t)+beta.*sin(beta.*t+theta).*exp(-alpha.*t)-beta.*sin(theta).*exp(lambda.*t))./((alpha+lambda).^2+beta.^2);
y2 = (cos(theta-phi).*exp(lambda.*t)-exp(-alpha.*t).*cos(beta.*t+theta-phi))/(sqrt((alpha+lambda).^2+beta.^2));
ynum=conv(x,h,'full')*dt;

figure();
hold on
plot(t,x,'- .');
plot(t,h,'- .');
title('Input and Impulse Response')
xlabel('Time [s]');
ylabel('Voltage [V]');
legend('x(t)','h(t)')

figure();
hold on
plot(t,ynum(1:length(ynum)/2+1),'- .');
plot(t,y1,'- .');
%plot(t,y2,'- .');
title('Numerical y(t) and Analytical y(t)')
xlabel('Time [s]');
ylabel('Voltage [V]');
legend('Numerical y(t)','Analytical y(t)')

figure();
hold on
%plot(t,ynum(1:length(ynum)/2+1),'- .');
plot(t,y1,'- .');
plot(t,y2,'- .');
title('Long Analytical Form(t) and Short Analytical y(t)')
xlabel('Time [s]');
ylabel('Voltage [V]');
legend('Long y(t)','short y(t)')




















A = alpha+lambda;
fac1 = 1/(A^2+beta^2);
fac2 = A*cos(theta).*exp(lambda.*t);
fac2 = -A*cos(beta.*t+theta).*exp(-alpha.*t);
fac3 = beta*sin(beta*t+theta).*exp(-alpha.*t);
fac4 = -beta*sin(theta).*exp(lambda.*t);
funcsol = fac1.*(fac1+fac2+fac3+fac4);

figure();
hold on
plot(t,funcsol,'- .');
%plot(t,y1,'- .');
plot(t,y2,'- .');
title('Long Analytical Form(t) and Short Analytical y(t)')
xlabel('Time [s]');
ylabel('Voltage [V]');
legend('funcsol','short y(t)')