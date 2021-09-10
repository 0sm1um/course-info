%This little script can generate datapoints for Linear Kalman Filter
%simulations. I am leaving it as a script because it would be very 
%cumbersome to use as a function.

clear all
clc

T = 50; %number of timesteps
initialValue = 1; %initial state of system
numRows = 1; %number of rows for state matrix

F = 1; %State transform matrix
G = 1; %Control transform matrix
u = 1; %Control input
Q = .01;  %covariance matrix of process noise
R = 1; %covariance matrix of measurement noise
x = zeros(numRows,50);
x(:,1) = [1];
for k = 1:(T - 1)
x(:,k+1) = F * x(:,k) + G * u + gaussianNoise(Q);
end