function [sum, k, error] = isum(tol)

k=1;             %
sum=1;           %a1
isum=pi^2/8;     %initial value  
error=pi^2/8-1;  %initial error
while error>tol
    k=k+1;
    an=1/(2*k-1)^2;      %make the calculation here
    sum=sum+an;
    error=abs(isum-sum);
       
end
end