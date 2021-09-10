function [root k]=secmethod(f,x0,x1,tol)

xi=x0;            %initialize xold
x=x1;             %initialize x
error=abs(x-xi);  %initialize error
k=0;              %initialize iteration counter

while error>tol
    k=k+1;                             %update iteration counter
    root=x-f(x)*(x-xi)/(f(x)-f(xi));   %do Secant calculation
    xi=x;                              %replace xold with x
    x=root;                            %replace x with xnew
    error=abs(x-xi);                   %update error
end
end