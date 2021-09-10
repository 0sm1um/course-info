%Project 2

clear all
clc

%% Question One

%I renamed my version of the function because I took issue with the
%arbitrary nature of "tankvol2". "tankvolg" I can guess the g
%stands for general.


tankvolg(1,2,1,1,-1)
tankvolg(1,2,1,1,1)
tankvolg(1,2,1,1,1.5)
tankvolg(1,2,1,1,3)

%% Question Two

sums=[];
sum=1;              
for k=1:10
    an=(3/5)^k;      
    sum=sum+an;  
end
sums=[sums;sum];
sum=1;
for k=1:20
    an=(3/5)^k;      
    sum=sum+an;  
end
sums=[sums;sum];
sum=1;
for k=1:30
    an=(3/5)^k;      
    sum=sum+an;  
end
sums=[sums;sum]
clear sum
%% Question Three
tols=[.1 .05 .01 .005 .001];
data=[];
for i=tols
    vec=psum(i);
    data=[data;vec];
end

figure(1)
plot(tols,data(:,3),'r*')
title('error vs tolerance')
ylabel('error')
xlabel('tolerance')

figure(2)
loglog(tols,data(:,2),'b*')
title('steps vs tolerance')
xlabel('log(tolerance)')
ylabel('log(steps)')

%Tolerance and error are related almost 1-1. Therefore an error of .0001
%would require a tolerance of .0001. And based on the second graph, a
%tolerance of .0001 would yield around 2500 steps.