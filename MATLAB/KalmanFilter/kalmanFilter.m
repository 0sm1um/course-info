%This little script can generate datapoints for Linear Kalman Filter
%simulations. I am leaving it as a script because it would be very 
%cumbersome to use as a function.

clear all
clc

T = 50; %number of timesteps
initialValue = 1; %initial state of system
numRows = 1; %number of rows for state matrix

F = [1 T; 0 1]; %State transform matrix
G = [0 0]; %Control transform matrix
H = [1 0];
u = [0 0]; %Control input
Q = .01;  %covariance matrix of process noise
R = 1; %covariance matrix of measurement noise

%Initialize all matricies for the loop
X = zeros(numRows, T);
X(:,1) = 1;
Xh = zeros(numRows, T);
Xh(:,1) = 1;
Zh = zeros(numRows, T);
Zh(:,1) = 1;
P = zeros(numRows, T);
P(:,1) = 1;
S = zeros(numRows, T);
S(:,1) = 1;
W = zeros(numRows, T);

for k = 1:(T - 1)
X(:,k+1) = F * X(:,k) + G * u + gaussianNoise(Q);
Xh(:,k+1) = F * Xh(:,k) + G * u;
Zh(:,k+1) = H * Xh(:,k);
Z(:,k+1) = H * X(:,k+1) + gaussianNoise(R);
P(:,k+1) = F * P(:,k) * F' + Q;
S(:,k+1) = R + H * P(:,k+1) * H';
W(:,k+1) = P(:,k+1) * H' * inv(S(:,k+1));
Xh(:,k+1) = Xh(:,k+1) + W(:,k+1) * (Z(:,k+1)- Zh(:,k+1));
end