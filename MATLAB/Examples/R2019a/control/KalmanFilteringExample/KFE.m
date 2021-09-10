%This little script can generate datapoints for Linear Kalman Filter
%simulations. I am leaving it as a script because it would be very 
%cumbersome to use as a function.

clear all
clc
F = 1 %State transform matrix
Gk = 1 %Control transform matrix
h = 1 %Measurement matrix 
q = .001;  %covariance matrix of process noise
vk = (sqrt(q)*randn(1)+1) %gaussian noise term for system
r = 1; %covariance matrix of measurement noise
wk = (sqrt(r)*randn(1)+1) %gaussian noise term for measurement
x = [1];
for k = 1:50
x =[x, F * x(k) + Gk + vk];
end
z = [];
for k = 1:50
z = [z, h * x(k) + wk];
end