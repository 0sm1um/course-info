function xn = newtmethod(f,xi,tol)
g=sym(f);
g=diff(g);
fprime=matlabFunction(g);     %Compute f'
x=xi;                         %Initialize x
error=abs(x)+1;               %Initialize error
k=0;                          %Initialize k
while error>tol
    k=k+1;
    xn=x-f(x)/fprime(x);
    error=abs(xn-x);
    x=xn;
end

end