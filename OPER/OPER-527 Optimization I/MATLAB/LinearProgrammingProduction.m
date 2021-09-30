clear all; clc
%Hugh Jass Production Problem
 A = [1,1,1,0,0,0,0,0,0,0,0,0;
      0,0,0,1,1,1,0,0,0,0,0,0;
      0,0,0,0,0,0,1,1,1,0,0,0;
      0,0,0,0,0,0,0,0,0,1,1,1;
      -1*[100,0,0,120,0,0,0,0,0,250,0,0];
      -1*[0,50,0,0,0,0,0,175,0,0,0,0];
      -1*[0,0,75,0,0,100,0,0,100,0,0,50]];
  
  b = [24;
       24;
       24;
       24;
       -2500;
       -1200;
       -4500;];
  
syms ta1 ta2 ta3 tb1 tb2 tb3 tc1 tc2 tc3 td1 td2 td3;

c = 3.75*(100*ta1+120*tb1+0*tc1+250*td1)+19.87*(50*ta2+175*tc2)+2.12*(75*ta3+100*tb3+100*tc3+50*td3);
clear ta1 ta2 ta3 tb1 tb2 tb3 tc1 tc2 tc3 td1 td2 td3;

%The matlab linprog funtion only minizes, so we are negating the 
%objective function to find the maximum.
c1 = -1*[375,1987/2,159,450,0,212,0,13909/4,212,1875/2,0,106];


lowerBound = zeros(12,1);
upperBound = Inf*ones(12,1);
 x = linprog(c1,A,b,[],[],lowerBound,upperBound)