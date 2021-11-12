clear all; clc
y_1 = dsolve('5*D2y+10*Dy+1*y=0','y(0)=2','Dy(0)=0','t'); h_1=diff(y_1);
y_2 = dsolve('D2y+5*Dy+6*y=0','y(0)=4','Dy(0)=-1','t');h_2=diff(y_1);

tau = linspace(1,10,100);

s1 = tau
s2 = tau.^2

syms t1
syms1 = t1
syms2 = t1^2


Ex = double(int(abs(syms1)^2,t1,0,10))
Ey = double(int(abs(syms2)^2,t1,0,10))

corr  = 1/sqrt(Ex*Ey)*double(int(syms1*syms2,t1,0,10))
corrplot= 1./sqrt(tau.^3/3 .* tau.^5/5) .* tau.^4/4

figure();
hold on
plot(tau,corrplot,'- .');
title('Question #9 Correlation Plot')
xlabel('Time [s]');
ylabel('Correlation Coefficient');
legend('corr(t)')

figure();
hold on
plot(tau,s1,'- .');
plot(tau,s2,'- .');
title('Question #9 Signal Plot')
xlabel('Time [s]');
ylabel('Arbitrary Units');
legend('s1(t)','s2(t)')