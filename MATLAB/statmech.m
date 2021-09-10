clc
clear all

Qa = [1:100]';
MultiplicityA =zeros(100,1);

for i = [1:100]
    MultiplicityA(i,1) = factorial(i+199) / (factorial(i) * factorial(199));
end

Qb = [100:-1:1]';
MultiplicityB = zeros(100,1);

for i = [100:-1:1]
    MultiplicityB(i,1) = factorial(i+99) / (factorial(i) * factorial(99));
end