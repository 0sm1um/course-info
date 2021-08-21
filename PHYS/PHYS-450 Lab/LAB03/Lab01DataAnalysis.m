clc;clear all;
%% Data
key=cell(1,8);
key{1}=["12,34"];key{2}=["21,43"];key{3}=["24,13"];key{4}=["42,31"];
key{5}=["43,21"];key{6}=["34,12"];key{7}=["31,42"];key{8}=["13,24"];
I=zeros(1,8);
I(1)=76.05;I(2)=75.15;I(3)=79.85;I(4)=80.8;
I(5)=75.2;I(6)=76.5;I(7)=80.8;I(8)=80.0;
U=zeros(1,8);
U(1)=109;U(2)=109;U(3)=263;U(4)=268;
U(5)=108;U(6)=109;U(7)=267;U(8)=271;

omg=abs(U./I);
rawData = [key' num2cell(I') num2cell(U')];
presentation = [key' num2cell(omg')];

%% Calculate Resistivity, Conductivity, and free charge carriers.
vertData = [omg(1) omg(2) omg(5) omg(6)];
horzData = [omg(3) omg(4) omg(7) omg(8)];
vertR = [mean(vertData) std(vertData)/sqrt(length(vertData))]; 
horzR = [mean(horzData) std(horzData)/sqrt(length(horzData))];
thickness = [5.6 0.2]*10^-6;                              %m

avgR = (vertR+horzR)/2;
sheetR = avgR*pi/log(2);
rho = errorProduct(sheetR,thickness);    %Resistivity Ohm*m
sigma = errorPow(rho,-1);                %Conductivity Ohm^-1 m^-1
mu = [1.5 0.3]*10^-2;                    %Electron Conductivity 
n = errorDivide(sigma,mu)/(1.6*10^-19);
rsPercentError = sheetR(2)/sheetR(1)
nPercentError = n(2)/n(1)*100

%% Plotting Commands
y1 = polyval(polyfit(I,U,1),I);
scatter(I,U,'b')
hold on;
plot(I,y1,'r');
xlabel('Current in mA')
ylabel('Electric Potential in mV')
title('Current vs Electric Potential')
legend({'Voltage Current Measurements','Linear Regression'},'Location','northwest')
