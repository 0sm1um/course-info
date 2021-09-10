clear all
clc

T = 50; %number of timesteps
MCRuns = 50; %MonteCarlo Runs
initialValue = 1; %initial state of system
numRows = 1; %number of rows for state matrix

F = 1; %State transform matrix
G = 1; %Control transform matrix
H = 1;
u = 1; %Control input
Q = .01;  %covariance matrix of process noise
R = 1; %covariance matrix of measurement noise

%Initialize all matricies for the loop
initializer(T, MCRuns);

%X = zeros(numRows, T);
%X(:,1) = 1;
%Xh = zeros(numRows, T);
%Xh(:,1) = 1;
%Zh = zeros(numRows, T);
%Zh(:,1) = 1;
%P = zeros(numRows, T);
%P(:,1) = 100;
%S = zeros(numRows, T);
%S(:,1) = 1;
%W = zeros(numRows, T);

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

function [X, Xh, Zh, P, S, W] = initializer(T,MCRuns);
State = cell(T,MCRuns);
statePrediction = cell(T,MCRuns);
measurementMatrix = cell(T,MCRuns);
stateCovariance = cell(T,MCRuns);
innovationCovariance = cell(T,MCRuns);
kalmanGain = cell(T,MCRuns);
for i = 1:50
    X{1,i} = 1;
    Xh{1,i} = 1;
    Zh{1,i} = 1;
    P{1,i} = 1;
    S{1,i} = 1;
end
end

function [F, X, G]
X(:,k+1) = F * X(:,k) + G * u + gaussianNoise(Q); %The real state