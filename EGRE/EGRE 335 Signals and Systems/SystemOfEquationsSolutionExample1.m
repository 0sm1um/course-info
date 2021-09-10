%% Close any graphs you have from a previous run. If you are running new 
%% code with new variables, use clear all or clearvars.
clear all
close all
clc
%% Set up any parameters you will need to use in your program; 
%% do not "hard code" values in your expressions.
% x1 coefficients:
a11 = 5;
a21 = -3;
a31 = 1;

% x2 coefficients:
a12 = 6;
a22 = -5;
a32 = -7;

% x3 coefficients:
a13 = -3;
a23 = 6;
a33 = 10;

% y values:
y1 = 7;
y2 = -12;
y3 = 20;

%% Declare the variables of your system - x1, x2, x3 (these are the unknowns):
syms x1 x2 x3

%% Set up the equations; note aij and yi are known parameters:

eqn1 = a11*x1 + a12*x2 + a13*x3 == y1;
eqn2 = a21*x1 + a22*x2 + a23*x3 == y2;
eqn3 = a31*x1 + a32*x2 + a33*x3 == y3;
%eqn4 = a41*x1 + a42*x2 + a43*x3 + a44*x4 == y4;

%% Use equationsToMatrix to convert the equations into the form AX = Y; 
%% The second input specifies the independent variables (x1,x2,x3) in the equations
[A,Y] = equationsToMatrix([eqn1, eqn2, eqn3], [x1, x2, x3]);

%% Use linsolve to solve AX=Y for the vector of unknowns X=[x1,x2,x3]
X = linsolve(A,Y);

%% Recover the values of x1, x2, and x3:
x_1 = double(X(1));
x_2 = double(X(2));
x_3 = double(X(3));
%x_4 = double(X(4));

Amat = [a11 a12 a13; a21 a22 a23; a31 a32 a33;];
Det = det(Amat);
