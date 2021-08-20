function [vx,vy,t,vxActual,vyActual]=velDataGenerator(vi,theta,xDev,yDev)
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
rho_air = 1.29;         % Air density (kg/m^3)
m       = 0.145;        % Mass of projectile (kg)
cD      = 0.5;          % Drag coefficient (spherical projectile)
r       = 0.11;        % Radius of projectile (m)
mu = 0.5*cD*(pi*r^2)*rho_air/m;

vy = [sind(theta)*vi];      %Initialize loop variables
vx = [cosd(theta)*vi];
t = [0];
deltat = .2;               %Time in seconds to step forward
tol = 0.0005;
while true %The classic do while in disguise
    t(end+1) = t(end)+deltat; 
    vy(end+1) = -(g/mu)+(vy(1)+g/mu)*exp(-mu*t(end));
    vy(end) = vy(end) + normrnd(0,yDev);
    vx(end+1) = vx(1)*exp(-mu*t(end));
    vx(end) = vx(end) + normrnd(0,xDev);
    if abs(vy(end)) >= abs(vy(1)) | abs(vy(end)-vy(end-1)) <= tol
        %vy(end)=[];
        %vx(end)=[];
        %t = t-1;
        break
    end
end
syms h;
vxActual = vx(1)*exp(-mu*h);
vyActual = -(g/mu)+(vy(1)+g/mu)*exp(-mu*h);
return