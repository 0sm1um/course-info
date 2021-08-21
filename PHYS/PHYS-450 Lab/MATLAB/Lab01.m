clc;clear all;
%% Data
key4=cell(1,8);
key4{1}=["12,34"];key4{2}=["21,43"];key4{3}=["24,13"];key4{4}=["42,31"];
key4{5}=["43,21"];key4{6}=["34,12"];key4{7}=["31,42"];key4{8}=["13,24"];
I4=zeros(1,8);
I4(1)=76.05;I4(2)=75.15;I4(3)=79.85;I4(4)=80.8;
I4(5)=75.2;I4(6)=76.5;I4(7)=80.8;I4(8)=80.0;
U4=zeros(1,8);
U4(1)=109;U4(2)=109;U4(3)=263;U4(4)=268;
U4(5)=108;U4(6)=109;U4(7)=267;U4(8)=271;

omg4=abs(U4./I4);
rawData = [key4' num2cell(I4') num2cell(U4')];
presentation = [key4' num2cell(omg4')];

%% Calculate Resistivity, Conductivity, and free charge carriers.
vertData = [omg4(1) omg4(2) omg4(5) omg4(6)];
horzData = [omg4(3) omg4(4) omg4(7) omg4(8)];
vertR = [mean(vertData) std(vertData)/sqrt(length(vertData))]; 
horzR = [mean(horzData) std(horzData)/sqrt(length(horzData))];
thickness4 = [5.6 0.2]*10^-6;                              %m

avgR = (vertR+horzR)/2;
sheetR = avgR*pi/log(2);
rho = errorMultiply(sheetR,thickness4);    %Resistivity Ohm*m
sigma = errorPow(rho,-1);                %Conductivity Ohm^-1 m^-1
mu = [1.5 0.3]*10^-2;                    %Electron Conductivity 
n = errorDivide(sigma,mu)/(1.6*10^-19);
rsPercentError = sheetR(2)/sheetR(1)*100;
rhoPercentError = rho(2)/rho(1)*100;
sigmaPercentError = sigma(2)/sigma(1)*100;
nPercentError = n(2)/n(1)*100;

%% Plotting Commands
y1 = polyval(polyfit(I4,U4,1),I4);
scatter(I4,U4,'b')
hold on;
plot(I4,y1,'r');
xlabel('Current in mA')
ylabel('Electric Potential in mV')
title('Current vs Electric Potential')
legend({'Voltage Current Measurements','Linear Regression'},'Location','northwest')
