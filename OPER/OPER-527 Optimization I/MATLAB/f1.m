function y = f1(x)

f = @(x) x^2*exp(-x^2) + (x-3)^2*exp(-(x-3)^2);
g = sym(f);
fprime = matlabFunction(diff(g,1));
fprimeprime = matlabFunction(diff(g,2));
disp([diff(g,2)])
y = [f(x) fprime(x) fprimeprime(x)];