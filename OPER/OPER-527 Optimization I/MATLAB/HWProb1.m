clear all; clc

f = @(x,y) x^2 - 24*x +y^2-12*y+200
syms x y
v = [x y]
fgrad = matlabFunction(gradient(f,v));
fhess = matlabFunction(hessian(f,v));

function z = objectiveFunction(x,y)
z = x^2 - 24*x +y^2-12*y+200
end

function z = zprime(f)
v = [x y]
gradient(f,v)
end