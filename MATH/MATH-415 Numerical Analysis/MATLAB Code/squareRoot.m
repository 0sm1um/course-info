function [xn,k,error] = squareRoot(a,x,tol)
xn = 0;
k = 0;
error = 0;
array = [];
while error >= tol
    xn = (x*(x^2+3*a)) / ((3*x^2) + a)
    x=xn;
    array = xn
    error=abs(sqrt(a)-xn)
    k=k+1
end
end 