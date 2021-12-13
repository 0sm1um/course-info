clear all; clc
%SIR HW Problem
%I just guessed at a and b for this model. Used ballpark data from Bubonic
%Plague.
a = 0.0004; b = 0.04; h = 0.0005;
Sn = @(S,I) -a*S*I;
In = @(S,I) a*S*I - b*I;
Rn = @(I) b*I;
t = 16; %Number of timesteps. I chose 16 to match part b dataset.
S = zeros(1,t/h);I = zeros(1,t/h);R = zeros(1,t/h);
S(1) = 990; I(1) = 10; R(1) = 0;

for i=1:t/h
    S(i+1) = S(i) + h * Sn(S(i),I(i));
    I(i+1) = I(i) + h * In(S(i),I(i));
    R(i+1) = R(i) + h * Rn(I(i));
    t(i+1) = i*h;
end
%Reformat data
S = S(1:length(S)/16:end);
I = I(1:length(I)/16:end);
R = R(1:length(R)/16:end);
t = 1:16

data = [t' S' I' R']