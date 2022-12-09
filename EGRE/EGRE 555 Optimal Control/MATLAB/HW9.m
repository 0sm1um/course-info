clear all
clc
%% Problem 1


%% Problem 2


%% Problem 3

clear all;
syms t
 % the characteristic polynominals a %
 A = [1, 1, 0, 0, 0; 0, 2, 1, 0, 0; 0, 0, 3, 1, 0; 0, 0, 0, 4, 1; 0, 0, 0, 0, 5];
 charpoly(A);
 % the minimal characteristic polynominals a %
 minpoly(A);
 % decompostion b %
 [T,J]=jordan(A);
 inv(T);
 %state transition matrix STM c %
 At = A * t;
 STM=expm(At);
 clear all
  % the characteristic polynominals a %
  syms l2 l t s
 A = [1,0;0,1]*[l2,0;0,l2]*[1,0;0,1];
 a1 = charpoly(A);
 % the minimal characteristic polynominals a %
 b1 = minpoly(A);
 % decompostion b %
 [T,J]=jordan(A);
 inv(T);
 %state transition matrix STM c %
 At = A * t;
 STM=expm(A*t);

  invrsn = (s*eye(2) - A)
 
 %{
 clear all
  % the characteristic polynominals a %
  syms l2 l t q s
 A = [1,-1,1;1,1,0;0,-1,1]*[-1,0,0;0,0,0;0,0,1]*[1,0,-1;-1,1,1;-1,1,2];
 a1 = charpoly(A);
 % the minimal characteristic polynominals a %
 b1 = minpoly(A);
 % decompostion b %
 [T,J]=jordan(A);
 inv(T);
 %state transition matrix STM c %
 At = A * t;
 STM=expm(A*(t-q));
 
 [1,-1,-1;1,0,1]* STM * [1,1;1,0;0,1]
 
 invrsn = inv((s*eye(3) - A))
 
 [1 -1 -1; 1 0 1] * invrsn * [1 1;1 0;0 1]
%}