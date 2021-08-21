clc;clear all;
%% Part 1
B = 7900;

%HALL EFFECT MEASUREMENTS
%SAMPLE 04
key4=cell(1,4);
%Hall Measurements for sample #4
key4{1}=["13,42+"];key4{2}=["13,42-"];key4{3}=["42,31+"];key4{4}=["42,31-"];

%in mA
IH4=zeros(1,4);
IH4(1)=70.2; IH4(2)=70.6; IH4(3)=88.8; IH4(4)=88.8;
%in mV
UH4=zeros(1,4);
UH4(1)=-121;UH4(2)=-139; UH4(3)=-175;UH4(4)=-153;
%In Ohms
omg4=(UH4./IH4);omg4 = ([omg4(1)-omg4(2) omg4(3)-omg4(4)]);
omg4 = [mean(omg4) std(omg4)/sqrt(length(omg4))];
%in cm
thickness4 = [5.6 0.2]*10^-4;

%cm^3/C

HallR4 = 10^8/B*errorMultiply(omg4,thickness4);
n4 = errorPow(1.6*10^-19*HallR4,-1);


%SAMPLE #206
%Triple Battery Voltages 4.37V

key206=cell(1,4);
%Hall Measurements for sample #206
key206{1}=["13,42+"];key206{2}=["13,42-"];key206{3}=["42,31+"];key206{4}=["42,31-"];
%in microA
IH206=zeros(1,4);
IH206(1)=201; IH206(2)=195; IH206(3)=199; IH206(4)=181;
%in mV
UH206=zeros(1,4);
UH206(1)=2.6;UH206(2)=-1.4; UH206(3)=1.5;UH206(4)=-2.4;


omg206=(UH206./IH206);omg206 = ([omg206(1)-omg206(2) omg206(3)-omg206(4)]);
omg206 = [mean(omg206) std(omg206)/sqrt(length(omg206))];
%in cm
thickness206 = [275 5]*10^-4;

%cm^3/C
HallR206 = 10^8/B*errorMultiply(omg206,thickness206);

n206 = errorPow(1.6*10^-19*HallR206,-1);


%% Part 2 Sample

L=1.3*10^-3;
W=0.35*10^-3;
t43=[430 25]*10^-6;
MultiMeterResistance=0.04;
R1=42.65;
Radj=R1-MultiMeterResistance;


%% Part 3


%Van der Pauw Measurements for sample #206

key206=cell(1,8);
key206{1}=["12,34"];key206{2}=["21,43"];key206{3}=["24,13"];key206{4}=["42,31"];
key206{5}=["43,21"];key206{6}=["34,12"];key206{7}=["31,42"];key206{8}=["13,24"];
I206=zeros(1,8); %In microAmps
I206(1)=325;I206(2)=187;I206(3)=330;I206(4)=629;
I206(5)=200;I206(6)=660;I206(7)=181;I206(8)=200;
U206=zeros(1,8); %In MiliVolts
U206(1)=6.1;U206(2)=4.0;U206(3)=5.8;U206(4)=12.2;
U206(5)=3.5;U206(6)=12.6;U206(7)=3.3;U206(8)=3.9;
I206=I206*10^-3; %Convert to miliAmps

%Van der Pauw Measurements #04
key4=cell(1,8);
key4{1}=["12,34"];key4{2}=["21,43"];key4{3}=["24,13"];key4{4}=["42,31"];
key4{5}=["43,21"];key4{6}=["34,12"];key4{7}=["31,42"];key4{8}=["13,24"];
I4=zeros(1,8);
I4(1)=76.05;I4(2)=75.15;I4(3)=79.85;I4(4)=80.8;
I4(5)=75.2;I4(6)=76.5;I4(7)=80.8;I4(8)=80.0;
U4=zeros(1,8);
U4(1)=109;U4(2)=109;U4(3)=263;U4(4)=268;
U4(5)=108;U4(6)=109;U4(7)=267;U4(8)=271;

omg4=(U4./I4);

omg206=(U206./I206);

%% Calculate Resistivity, Conductivity, and free charge carriers.

vertData = [omg206(1) omg206(2) omg206(5) omg206(6)];
horzData = [omg206(3) omg206(4) omg206(7) omg206(8)];
vertR = [mean(vertData) std(vertData)/sqrt(length(vertData))]; 
horzR = [mean(horzData) std(horzData)/sqrt(length(horzData))];
thickness206 = [275 5]*10^-6;                              %m

avgR = (vertR+horzR)/2;
sheetR = avgR*pi/log(2);
rho206 = errorMultiply(sheetR,thickness206);    %Resistivity Ohm*m
sigma206 = errorPow(rho206,-1);                %Conductivity Ohm^-1 m^-1

vertData = [omg4(1) omg4(2) omg4(5) omg4(6)];
horzData = [omg4(3) omg4(4) omg4(7) omg4(8)];
vertR = [mean(vertData) std(vertData)/sqrt(length(vertData))]; 
horzR = [mean(horzData) std(horzData)/sqrt(length(horzData))];
thickness4 = [275 5]*10^-6;                              %m
avgR = (vertR+horzR)/2;
sheetR = avgR*pi/log(2);

rho4 = errorMultiply(sheetR,thickness206);    %Resistivity Ohm*m
sigma4 = errorPow(rho206,-1);                %Conductivity Ohm^-1 m^-1

mu4 = errorDivide(sigma4,n4)./(1.6*10^-19);
mu206 = errorDivide(sigma206,n206)./(1.6*10^-19);
