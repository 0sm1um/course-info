clear all; clc
%McDonalds Problem
c1 = [1.39,1.99,1,3.79]'; %Cost of items
A = [-220,-170,-300,-379;
     10,10,14,20;
     180,330,745,582];
 b = [-1000,50,2300]';
 
 lowerBound = zeros(4,1);
 
 x = linprog(c1,A,b,[],[],lowerBound,[]);