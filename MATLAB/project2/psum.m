function vec = psum(tol)

k=1;             %Initial Step
sum=1;           %Initial Sum
esum=pi^2/8;     %Expected sum
error=pi^2/8-1;  %initial error
while error>tol
    k=k+1;
    an=1/(2*k-1)^2;      %make the calculation here
    sum=sum+an;
    error=abs(esum-sum);
       
end
vec=[sum, k, error];
end