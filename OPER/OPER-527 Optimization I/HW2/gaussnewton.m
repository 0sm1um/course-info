function output = gaussnewton(f,xi,tol)
  %Note: Input must be in a function handle. "@(x) x^2..." format
  %This is a function to find a local maxima/minima of a function.
g=sym(f);
fprime=matlabFunction(diff(g));                    %Set f equal to the first derivative.
fprimeprime= matlabFunction(diff(g,2));       %Setting fprime equal to the second derivative.
x=xi;                         %Initialize x
error=abs(x)+1;               %Initialize error
k=0;                          %Initialize k
xn=[];
while error>tol
    k=k+1;                    %Step
    xn=x-fprime(x)/fprimeprime(x);      %Current guess at root
    error=abs(xn-x);
    x=xn;
end
output = [xn f(xn) k];
end