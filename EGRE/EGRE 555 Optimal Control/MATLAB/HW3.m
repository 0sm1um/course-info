clear all
clc
%% Problem 1

A = [4,1,0;
    0,1.5,2;
    0,0,-1];

c = exp(A);
d = expm(A);
soln = c-d;
 
 %% Problem 2
 
 A2 = [4 1 3;
       0 4 1;
       0 0 4];
 
 D = [4 0 0;
      0 4 0;
      0 0 4];
 N = [0 1 3;
      0 0 1;
      0 0 0];
 
 N * N;
   
 expA2 = expm(A2);
   
 %% Problem 3
 
A3 = [0 2 3 4;
      0 0 3 5;
      0 0 0 4;
      0 0 0 0;];
 Asqr = A3 * A3;
 Acub =   A3 * A3 * A3;
 Ahyp =  A3 * A3 * A3 * A3;
 
 expm(A3)
 
 %% Problem 4
 A4 = [2,1;
       -1 0];
   
   
