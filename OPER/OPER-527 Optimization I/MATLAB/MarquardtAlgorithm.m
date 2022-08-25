function [xn,k,error] = marquardtmethod(f,xi,tol)
  %Note: Input must be in a function handle. "@(x) x^2..." format
g=sym(f);
g=diff(g);
fprime=matlabFunction(g);     %Compute f'
x=xi;                         %Initialize x
error=abs(f(x))+1;               %Initialize error
k=0;                          %Initialize k
xn=[]
while error>tol
    k=k+1;                    %Step
    xn=x-inv(hessian(f,x)+k*eye(size(x)))*gradient(f);      %Current guess at root
    error=abs(f(xn)-f(x));
    x=xn;
end

end