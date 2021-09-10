function [xn,k,error] = newtmethod(f,xi,tol)
  %Note: Input must be in a function handle. "@(x) x^2..." format
g=sym(f);
g=diff(g);
fprime=matlabFunction(g);     %Compute f'
x=xi;                         %Initialize x
error=abs(x)+1;               %Initialize error
k=0;                          %Initialize k
xn=[]
while error>tol
    k=k+1;                    %Step
    xn=x-f(x)/fprime(x);      %Current guess at root
    error=abs(xn-x);
    x=xn;
end

end