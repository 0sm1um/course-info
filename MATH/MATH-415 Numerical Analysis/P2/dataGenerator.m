function [x,y,t]=dataGenerator(vi,theta,xDev,yDev)
%dataGenerator: Generates simulated data points for a projectile traveling
%under no external forces besides gravity in two dimensions.
%Arguments:
% vi    --- Initial Velocity
% theta --- Angle above the horizontal in degrees
%Optional Arguments:
% xDev  --- Standard Deviation used to compute normally distributed noise
% yDev  --- Standard Deviation used to compute normally distributed noise
if ~exist('xDev', 'var')
    xDev = 0;
end
if ~exist('yDev', 'var')
    yDev = 0;
end
y = [0];
x = [0];
t = 1;

while true %The classic do while in disguise
    t = t+1;
    y(t) = -1/2*9.81*t^2 + sind(theta)*vi*t;
    y(t) = y(t) + normrnd(0,yDev);
    x(t) = cosd(theta)*vi*t;
    x(t) = x(t) + normrnd(0,xDev)
    if y(end) <= 0 
        y(end)=[];
        x(end)=[];
        t = t-1;
        break;
    end
end
return