function [vx,vy,t]=noDragGenerator(vi,theta,xDev,yDev)
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
%Parameters of Projectile
g       = 9.81;         % Acceleration due to gravity (m/s^2)
vy = [sind(theta)*vi];      %Initialize loop variables
vx = [cosd(theta)*vi];
t = 0;
while true %The classic do while in disguise
    t(end+1) = t(end)+.1;
    vy(end+1) = -g*t(end)+sind(theta)*vi;
    vy(end) = vy(end) + normrnd(0,yDev);
    vx(end+1) = cosd(theta)*vi;
    vx(end) = vx(end) + normrnd(0,xDev);
    if abs(vy(end)) >= abs(vy(1));
        %vy(end)=[];
        %vx(end)=[];
        %t = t-1;
        break;
    end
end
return