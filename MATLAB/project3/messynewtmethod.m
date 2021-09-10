function [xn,k,error] = messynewtmethod(f,xi,tol)
g=sym(f);
g=diff(g);
fprime=matlabFunction(g);     %Compute f'
x=xi;                         %Initialize x
error=abs(x)+1;               %Initialize error
k=0;                          %Initialize k
while error>tol
    k=k+1;                    %Step
    xn=x-f(x)/fprime(x);      %Current guess at root
    error=abs(xn-x);
    x=xn;
end
vec=[xn k error]
end
% I couldn't figure out how to cleanly output a vector of the 3 things I
% want, so I just made a function that splurges out a vector and a number.
% I hate it so I differentiated the "clean" and "messy" versions of my
% function.