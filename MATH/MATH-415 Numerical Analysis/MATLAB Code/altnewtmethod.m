function output = altnewtmethod(f,xi,tol)
%Accepts matlabFunction f, initial value xi, and tolerance as arguments
g=sym(f);
g=diff(g);
fprime=matlabFunction(g);     %Compute f'
x=xi;                         %Initialize x
error=abs(x)+1;               %Initialize error
k=0;                          %Initialize k
xn=0;
while error >= tol
    k=k+1;                    %Step
    xn=x-f(x)/fprime(x);      %Current guess at root
    error=abs(f(xn));         %Alternate Error Calculation
    x=xn;
end
output = [xn,k,error];
end