clear all
clc

T = 50; %number of timesteps
initialValue = 1; %initial state of system
numRows = 2; %number of rows for state matrix
k = 1
F = [0;10]; %State transform matrix
G = 1; %Control transform matrix
H = [1;k^2];
u = [0;0]; %Control input
Q = [1;1];  %covariance matrix of process noise
R = 1; %covariance matrix of measurement noise

%Initialize all matricies for the loop
X = zeros(numRows, T);
X(:,1) = 1;
Xh = zeros(numRows, T);
Xh(:,1) = 1;
Zh = zeros(numRows, T);
Zh(:,1) = 1;
P = zeros(numRows, T);
P(:,1) = 100;
S = zeros(numRows, T);
S(:,1) = 1;
W = zeros(numRows, T);

for k = 1:(T - 1)
X(:,k+1) = F * X(:,k) + G * u + gaussianNoise(Q); %The real state
Xh(:,k+1) = F * Xh(:,k) + G * u; %State priori prediction
Zh(:,k+1) = H * Xh(:,k); %State measurement prediction
Z(:,k+1) = H * X(:,k+1) + gaussianNoise(R); %Measurement
P(:,k+1) = F * P(:,k) * F' + Q; %State prediction covariance
S(:,k+1) = R + H * P(:,k+1) * H'; %Innovation covariance
W(:,k+1) = P(:,k+1) * H' * inv(S(:,k+1)); %Filter gain
Xh(:,k+1) = Xh(:,k+1) + W(:,k+1) * (Z(:,k+1)- Zh(:,k+1)); %State Estimate
P(:,k+1) = P(:,k+1) - W(:,k+1) * S(:,k+1)* W(:,k+1)'; %Updated State Covariance
end