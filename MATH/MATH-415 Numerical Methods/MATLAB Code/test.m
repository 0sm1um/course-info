clear all
clc

A = [20,15,10;-3,-2.497,7;5,1,3;1,1,1];
b = [45;1.751;9];
size(A)

%Q = LUFact(A,b);
Z = LUSolve(A,b)

[L,U] = lu(A)