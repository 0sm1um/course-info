clear all
clc
%% Problem 1

A1 = [1 1 0 0 0 0;
      0 2 1 0 0 0;
      0 0 3 1 0 0;
      0 0 0 4 1 0;
      0 0 0 0 5 1;
      1 2 3 4 5 6;];
  
 [T1,D1,p] = eig(A1);
 W1 = T1'

Aalt = real(T1 * D1 * T1^-1);
R = [];
%for i=[1:6]
%    R = [R;T1(:,i)*W1(:,i)]
%end

R3 = T1*p;

E3 = expm(12*A1);

%% Problem 2
syms L t
A2A = [L 1;
       0 L];
[T2A,D2A,W2A] = eig(A2A);

%Tr2 = T2A*expm(D2A*t)*T2A;

W2A = inv(T2A)
for k=[1:size(A,2)]
R1B = T(:,k) * W2A(:,k)
end
A2B = [-2*t t;
       t -2*t];
[T2B,D2B,W2B] = eig(A2B);
Tr2 = T2B*expm(D2B*t)*T2B^(-1);

%% Problem 3
syms L t
A3A = [-1 0 0;
        0 L 1;
        0 0 L];
A3B = [L 0 0;
       0 L 0;
       0 0 -1];
[T3A,D3A,W3A] = eig(A3A);
[T3B,D3B,W3B] = eig(A3B);

%Tr3A = T3A * expm(D3A*t) * T3A^-1
%Tr3B = T3B * expm(D3B*t) * T3B^-1
%Tr2 = T2A*expm(D2A)*T2A;

%% Problem 4

%Liouville Formula

%Only focused on diagonal eigenvalue matricies

A4A = [-4 4;
       -8 6];
A4B = [0 10 8 -22 8 -2 -2 -2 -2;
       -4 14 1 0 0 0 0 0 0;
       0 0 3 1 0 0 0 0 0;
       0 0 0 4 1 0 0 0 0;
       0 0 0 0 5 1 0 0 0;
       1 2 3 4 5 6 0 0 0;
       0 0 0 4 1 0 0 0 0;
       0 0 0 0 5 1 0 0 0;
       1 2 3 4 5 6 0 0 0;];

[T4A,D4A,WA] = eig(A4A);
[T4B,D4B,W4B] = eig(A4B);

Tr4A = T4A * expm(D4A*t) * T4A^-1
Tr4B = T4B * expm(D4B*t) * T4B^-1


%% Problem 5

A5 = [0,0,8*t;
      0,L,0;
      0,0,0];

[T5,D5,W5] = eig(A5);

Tr5 = T5 * expm(D5*t) * T5^-1
