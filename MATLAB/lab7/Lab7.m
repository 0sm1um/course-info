%Project 7

%% Problem 1

%My function is named "newtmethod" as opposed to "newtonmethod" for brevity.

%% Problem 2

f1=newtmethod(@(x) x^4-x^2-2,2,1*10^-9);
f2=newtmethod(@(x) exp(x-2.6)-1.5,2,1*10^-9);
f3=newtmethod(@(x) atan(x), 1,1*10^-9);

answers=["x^4-x^2-2" "e^(x-2.6)-1.5" "arctan(x)"; f1 f2 f3]