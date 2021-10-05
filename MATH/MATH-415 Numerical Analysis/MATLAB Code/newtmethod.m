function output = newtmethod(f,xi,tol)
%Accepts matlabFunction f, initial value xi, and tolerance as arguments
g=sym(f);
g=diff(g);
fprime=matlabFunction(g);     %Compute f'
x=xi;                         %Initialize x
error=abs(x)+1;               %Initialize error
k=0;                          %Initialize k
xn=0;
array = [];
while error >= tol
    k=k+1;                    %Step
    array = [array x]
    xn=x-f(x)/fprime(x);      %Current guess at root
    error=abs(xn-x);          %Normal Error Calculation
    x=xn;
end
output = [array];
end