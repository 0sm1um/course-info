clc;clear all
%% Question 1
vf = [37.0 3.5];
vi = [7.15 0.55];
a = [1.80 0.15];
vf2 = errorPow(vf,2)
vi2 = errorPow(vi,2)
num = errorAdd(vf2,-vi2)
x = errorDivide((num),2.*a)

%% Question 2

%1/f = (n-1)(1/r1 + 1/r2)

n = [1.515 0.001]
R1 = [112.5 4.5]
R2 = [201.5 7.5]
coef = [n(1)-1 n(2)]
Rsum=errorAdd(errorPow(R1,-1),errorPow(R2,-1))
product=errorMultiply(coef,Rsum)
errorPow(product,-1)