%John Hiles

clear all
clc

%% Question Part A

error1 = abs(sin(pi/3) - taylorSin(pi/3,1));
fprintf('\nAbsolute Error for first two terms, n=1: %d\n', error1)

error2 = abs(sin(pi/3) - taylorSin(pi/3,4));
fprintf('\nAbsolute Error for first five terms, n=4: %d\n', error2)


%% Question Part B

tol = .001;    %iterate until absolute error is within this value
n = 0;         %Initialize series order to zero

while tol < abs(sin(3) - taylorSin(3,n))
    n = n + 1;  %Terms range from 0 to n, therefore terms == n + 1
end

fprintf('\nError is within %.0d after %d terms.\n', tol, n+1)