%% John H

clear all
clc

%% Problem One

mat=[0 0 0 0;0 0 0 0; 0 0 0 0]';

%a

mat(3,:)=[-1;6;14];

%b

mat(2,:)=[];

%c


mat2=[-7,6,14]*mat

%d

mat3=mat*[-7,6,14]'

%% Problem Two

h=4;
R=2;
r=1;
volume=pi*h*(R^2-r^2);

disp(volume)

%% Problem Three

n=randi(100);
vector=[1:n];
plot(vector,vector.^2)